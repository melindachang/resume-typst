#let data = yaml("details.yml")

#let parse_date(content) = {
  if type(content) == str [#eval(content, mode: "markup")] else [#content]
}

#set page(margin: 0.75in)
#set text(
  font: "EB Garamond",
  weight: 500,
  number-type: "old-style",
  hyphenate: true,
)

#align(center)[#text(size: 15pt)[
    #smallcaps[#data.name]]
]

#show link: set text(fill: rgb(11.7%, 68.2%, 85.8%))

#show heading: smallcaps
#show heading: set text(weight: 500, size: 12pt)
#show heading: set block(above: 22pt, below: 12pt)

#grid(
  columns: 2,
  column-gutter: 1fr,
  align: (left, right),
  [#data.phone \
    #link("mailto:" + data.email)[#data.email]
  ],
  [#for el in data.links [#link("https://" + el)[#el] \
  ]],
)

= Skills

#for el in data.skills [
  #el#if el != data.skills.last() [ $dot.c$ ] else [.]
]

= Education

#for el in data.education [
  #emph[#el.degree], expected #el.expected \
  #el.university $dot.c$ #el.location $dot.c$ GPA: #el.gpa
]

= Related Experience

#show grid: set block(below: 0.6em)
#for el in data.related_experience [
  #grid(
    columns: (3fr, 2fr),
    [#emph[#el.title], #el.group], [#parse_date(el.years)],
  )
  #el.employer $dot.c$ #el.location \
  #el.description
]

= Other Experience

#for el in data.other_experience [
  #emph[#el.title],#if el.at("group", default: 0) != 0 [ #el.group, ] #el.years \
  #el.employer $dot.c$ #el.location
  #parbreak()
]

= Service

#for el in data.service [
  #emph[#el.title], #el.organization, #parse_date(el.years) \
  #el.description
  #parbreak()
]

= Projects

#for el in data.projects [
  #link(el.url)[#emph[#el.name]], #parse_date(el.years). #el.description
  #parbreak()
]

= Honors

#for el in data.honors [
  #el.name, #parse_date(el.years). \
]
