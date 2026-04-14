// Presentation-first theme (Berkeley-inspired)

#let colors = (
  primary: rgb("#1F4788"),
  accent: rgb("#D99E1A"),
  bg: rgb("#F7F9FC"),
  white: rgb("#FFFFFF"),
  text: rgb("#1F1F1F"),
  muted: rgb("#5E6470"),
)

#let sizes = (
  title: 50pt,
  subtitle: 26pt,
  slide_title: 28pt,
  body: 20pt,
  note: 14pt,
)

#let slide_width = 13.333in
#let slide_height = 7.5in

#let slide_setup() = {
  set page(
    width: slide_width,
    height: slide_height,
    margin: (top: 1.1cm, bottom: 0.8cm, left: 1.0cm, right: 1.0cm),
    fill: colors.bg,
  )
  set text(size: sizes.body, fill: colors.text)
  set heading(numbering: none)
}

#let title_slide(main_title, subtitle, author, date) = {
  page(width: slide_width, height: slide_height, fill: colors.primary)[
    #set align(center + horizon)
    #set text(fill: colors.white, weight: "bold")

    #text(size: sizes.title)[#main_title]
    #v(0.5em)

    #set text(fill: colors.accent, weight: "regular")
    #text(size: sizes.subtitle)[#subtitle]

    #v(1.8em)
    #set text(fill: colors.white, size: sizes.body, weight: "regular")
    #author
    #v(0.25em)
    #date
  ]
}

#let section_slide(label, title) = {
  page(width: slide_width, height: slide_height, fill: colors.primary)[
    #set align(center + horizon)
    #set text(fill: colors.white)

    #text(size: 16pt, weight: "regular")[#label]
    #v(0.25em)
    #text(size: 40pt, weight: "bold")[#title]
  ]
}

#let slide(title, body, footer: "") = {
  page(
    width: slide_width,
    height: slide_height,
    header: block(fill: colors.primary, inset: (x: 10pt, y: 6pt), radius: 4pt)[
      #text(size: sizes.slide_title, fill: colors.white, weight: "bold")[#title]
    ],
    footer: align(right, text(size: sizes.note, fill: colors.muted)[#footer]),
  )[
    #set text(size: sizes.body, fill: colors.text)
    #align(center + horizon)[
      #block(width: 92%)[
        #body
      ]
    ]
  ]
}

#let definition(title, body) = {
  box(
    width: 100%,
    fill: colors.white,
    stroke: (left: 5pt + colors.primary, rest: 0.8pt + rgb("#D5D9E2")),
    inset: 10pt,
    radius: 5pt,
  )[
    #text(weight: "bold", fill: colors.primary)[Definition - #title]
    #v(0.2em)
    #body
  ]
}

#let theorem(title, body) = {
  box(
    width: 100%,
    fill: colors.white,
    stroke: (left: 5pt + colors.accent, rest: 0.8pt + rgb("#D5D9E2")),
    inset: 10pt,
    radius: 5pt,
  )[
    #text(weight: "bold", fill: colors.primary)[Theorem - #title]
    #v(0.2em)
    #body
  ]
}

#let keypoint(body) = {
  box(
    width: 100%,
    fill: rgb("#FFF7E8"),
    stroke: 1.2pt + colors.accent,
    inset: 10pt,
    radius: 5pt,
  )[
    #body
  ]
}
