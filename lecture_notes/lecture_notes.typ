#import "lyceum/lib.typ": FRONT-MATTER, BODY-MATTER, APPENDIX, BACK-MATTER
#import "../utils.typ": *

#let TEXT-SIZE = 12pt

//----------------------------------------------------------------------------//
//                                FRONT-MATTER                                //
//----------------------------------------------------------------------------//

#show: FRONT-MATTER.with(
  // Document metadata
  title: (
    title: "MA2008B",
    subtitle: "Numerical Analysis for Non-Linear Optimization",
    sep: " - "
  ),
  authors: (
    (
      preffix: "Dr.",
      given-name: "Juliho",
      name: "Castillo Colmenares",
      suffix: "Ph.D.",
      affiliation: "Tecnológico de Monterrey",
      email: "julihocc@yahoo.com",
    ),
  ),
  publisher: "Tecnológico de Monterrey",
  affiliated: (
    illustrator: ("Google Gemini 3.0 Pro", "Claude Sonnet 4.5"),
    organizer: "MA2008B",
  ),
  keywords: ("numerical analysis", "optimization", "control theory", "mathematics"),
  date: auto, // auto => datetime.today()
  // Document general format
  page-size: (width: 8.5in, height: 11in),
  page-margin: (inside: 1in, rest: 1in),
  page-binding: left,
  text-font: ("New Computer Modern", "Libertinus Serif"),
  text-size: TEXT-SIZE,
  lang-name: "en",
)

// The lyceum auto-generates the title page

#show: thmrules

// Show rule for the outline
#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}

= Contents

#outline(
  title: none,
  target: heading.where(level: 1),
  indent: auto,
)


//----------------------------------------------------------------------------//
//                                BODY-MATTER                                 //
//----------------------------------------------------------------------------//

#show: BODY-MATTER.with(TEXT-SIZE, "Chapter", ship-part-page: false)

// Include modules here. Order matters.
#include "sections/01_control_theory/01_main.typ"
#include "sections/02_modeling/02_main.typ"
#include "sections/03_transient_response/03_main.typ"
#include "sections/04_optimization/04_main.typ"
#include "sections/05_frequency_response/05_main.typ"
#include "sections/06_design_compensation/06_main.typ"
#include "sections/07_lyapunov_stability/07_main.typ"
#include "sections/08_finite_element_method/08_main.typ"
#include "sections/09_nonlinear_fem/09_main.typ"
#include "sections/10_topics_trends/10_main.typ"


//----------------------------------------------------------------------------//
//                                  APPENDIX                                  //
//----------------------------------------------------------------------------//

// #show: APPENDIX.with(TEXT-SIZE, "Appendix", ship-part-page: true)


//----------------------------------------------------------------------------//
//                                BACK-MATTER                                 //
//----------------------------------------------------------------------------//

// #show: BACK-MATTER.with(TEXT-SIZE, ship-part-page: false)
