#import "typst-slides/slides.typ": *
#import "typst-slides-unipd/unipd.typ": *
#import "plot.typ": *

#set text(font: "New Computer Modern Sans")

#show: slides.with(
  title: "Solving Yashi with SAT",
  authors: "Giacomo Stevanato",
  date: "July 2023",
  aspect-ratio: "4-3",
  theme: unipd-theme(),
)

#slide(theme-variant: "title")

#new-section("Introduction")

#let nodes = ((1, 1), (1, 7), (2, 2), (2, 4), (3, 5), (4, 1), (4, 4), (5, 5), (5, 7), (6, 2), (6, 4), (6, 6), (7, 1), (7, 3), (7, 5))
#let edges = ((0, 1), (0, 5), (1, 8), (2, 3), (2, 9), (3, 6), (4, 7), (5, 6), (5, 12), (6, 10), (7, 8), (7, 14), (9, 10), (10, 11), (12, 13), (13, 14))
#let sol_edges = ((0, 1), (0, 5), (1, 8), (2, 3), (3, 6), (4, 7), (5, 6), (5, 12), (6, 10), (7, 8), (9, 10), (10, 11), (12, 13), (13, 14))

#slide(title: "Yashi")[
  #place(dx: 50%, box(width: 50%, align(center + horizon,
    scale(110%, plot(nodes, sol_edges))
  )))
  #box(width: 50%)[
    - start with dots in a grid

    - draw only horizontal and vertical segments

    - all dots must be connected together

    - no crossing segments

    - no cycles
  ]
]

#slide(title: "Goal")[
  // TODO: Show goal: find solution, find min-length solution  
]

#new-section("Solution")

#slide(title: "Simplifying the problem")[
  // TODO: finding the edges
  // TODO: finding the conflicts
]

#slide(title: "Solution properties")[
  // TODO: What is the solution in the model
]

#slide(title: "Alternative solution properties")[
  // TODO: Solution with connected -> len(nodes) - 1 edges
]

#slide(title: "Preventing cycles")[
  // TODO: Constraints for preventing cycles
]

#slide(title: "Minimum length solution")[
  // TODO: Max-SAT stuff
]

#slide(theme-variant: "full")[
  Demo
]

#slide(theme-variant: "end")[
  Thank you for your attention
]
