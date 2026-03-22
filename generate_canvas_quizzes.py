import zipfile
import re
import os
import glob
from xml.sax.saxutils import escape

def generate_qti_xml(quiz_title, questions):
    """Generates the QTI XML structure for Canvas."""
    xml = '<?xml version="1.0" encoding="UTF-8"?>\n'
    xml += '<questestinterop xmlns="http://www.imsglobal.org/xsd/ims_qtiasiv1p2">\n'
    
    # Use a clean identifier without spaces or special characters
    ident = re.sub(r'[^a-zA-Z0-9_]', '', quiz_title.replace(" ", "_").lower())
    if not ident:
        ident = "quiz"
        
    xml += f'  <assessment ident="{ident}" title="{escape(quiz_title)}">\n'
    xml += '    <section ident="section_1" title="Main Section">\n'
    
    for i, q in enumerate(questions):
        points = q.get("points", 10)
        xml += f'      <item ident="q{i}" title="Question {i+1}">\n'
        xml += '        <itemmetadata>\n'
        xml += '          <qtimetadata>\n'
        xml += '            <qtimetadatafield>\n'
        xml += '              <fieldlabel>points_possible</fieldlabel>\n'
        xml += f'              <fieldentry>{points}</fieldentry>\n'
        xml += '            </qtimetadatafield>\n'
        xml += '          </qtimetadata>\n'
        xml += '        </itemmetadata>\n'
        xml += '        <presentation>\n'
        
        # Question Text
        xml += f'          <material><mattext texttype="text/plain">{escape(q["text"])}</mattext></material>\n'
        xml += '          <response_lid ident="res" rcardinality="Single">\n'
        xml += '            <render_choice>\n'
        
        # Options
        for j, opt in enumerate(q["options"]):
            xml += f'              <response_label ident="a{j}">\n'
            xml += f'                <material><mattext texttype="text/plain">{escape(opt)}</mattext></material>\n'
            xml += '              </response_label>\n'
        
        xml += '            </render_choice>\n'
        xml += '          </response_lid>\n'
        xml += '        </presentation>\n'
        xml += '        <resprocessing>\n'
        xml += f'          <outcomes><decvar varname="SCORE" vartype="Decimal" defaultval="0" maxvalue="{points}"/></outcomes>\n'
        xml += '          <respcondition continue="No">\n'
        # Set Correct Answer
        xml += f'            <conditionvar><varequal respident="res">a{q["correct_index"]}</varequal></conditionvar>\n'
        xml += f'            <setvar varname="SCORE" action="Set">{points}</setvar>\n'
        xml += '          </respcondition>\n'
        xml += '        </resprocessing>\n'
        xml += '      </item>\n'
        
    xml += '    </section>\n'
    xml += '  </assessment>\n'
    xml += '</questestinterop>'
    return xml

def create_canvas_zip(quiz_title, questions, output_filename="quiz.zip"):
    """Packages the XML files into a QTI zip for Canvas."""
    manifest_xml = '''<?xml version="1.0" encoding="UTF-8"?>
<manifest identifier="manifest_1">
  <resources>
    <resource identifier="res_1" type="imsqti_xmlv1p2">
      <file href="assessment.xml"/>
    </resource>
  </resources>
</manifest>'''

    assessment_xml = generate_qti_xml(quiz_title, questions)

    with zipfile.ZipFile(output_filename, 'w') as zipf:
        zipf.writestr('imsmanifest.xml', manifest_xml)
        zipf.writestr('assessment.xml', assessment_xml)
        
    print(f"Success: Created {output_filename} with {len(questions)} questions.")

def parse_txt_file(filepath):
    """Parses a generated quiz.txt file."""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read().strip()
        
    # Standard format: blocks separated by double newlines
    blocks = content.split('\n\n')
    
    quiz_title = blocks[0].strip()
    if quiz_title.startswith("Quiz: "):
        quiz_title = quiz_title[6:].strip()
        
    questions = []
    
    for block in blocks[1:]:
        lines = block.strip().split('\n')
        if len(lines) < 5:
            continue
            
        opts_raw = lines[-4:]
        q_text_lines = lines[:-4]
        
        # Combine question lines and strip the numbering (e.g. "1. ")
        q_text = " ".join(q_text_lines).strip()
        q_text = re.sub(r'^\d+\.\s*', '', q_text)
        
        options = []
        correct_index = 0
        
        for i, opt in enumerate(opts_raw):
            opt = opt.strip()
            # Determine correctness
            is_correct = opt.startswith('*')
            if is_correct:
                correct_index = i
                opt = opt[1:] # discard '*'
                
            # Discard letter prefix a), b), etc.
            # Usually starts with 'a) ', could be 'b)'
            opt = re.sub(r'^[a-d]\)\s*', '', opt)
            
            options.append(opt.strip())
            
        questions.append({
            "text": q_text,
            "options": options,
            "correct_index": correct_index,
            "points": 10
        })
        
    return quiz_title, questions

# ==========================================
# RUN EXPORT FOR ALL 16 QUIZZES
# ==========================================
if __name__ == "__main__":
    files = glob.glob('quizzes/*/quiz.txt')
    files.sort()
    
    if not files:
        print("No quiz.txt files found!")
        
    for filepath in files:
        quiz_title, questions = parse_txt_file(filepath)
        if questions:
            # Output zip directly inside the respective quiz chapter folder
            dir_path = os.path.dirname(filepath)
            
            # Create a clean zip filename based on directory name
            dir_name = os.path.basename(dir_path)
            output_zip = os.path.join(dir_path, f"{dir_name}_canvas.zip")
            
            create_canvas_zip(quiz_title, questions, output_zip)
        else:
            print(f"Could not parse any questions in {filepath}.")
