#import "typst-slides/slides.typ": *
#import "typst-slides-unipd/unipd.typ": *
#import "plot.typ": *
#import "tree.typ": *

#set text(font: "New Computer Modern Sans")
#set list(spacing: 40pt)

#show: slides.with(
  title: "Solving Yashi with SAT",
  authors: "Giacomo Stevanato",
  date: "July 2023",
  aspect-ratio: "4-3",
  theme: unipd-theme(),
)

#slide(theme-variant: "title")

#new-section("Introduction")

#slide(title: "Yashi")[
  #set list(spacing: 1.2em)

  - Start with dots in a grid

  - Draw horizontal and vertical segments connecting dots

  - All dots must be connected together

  - No cycles

  - No crossing segments
][
  #align(center, scale(110%, plot_empty))
]

#slide(title: "Objective")[
  - Find a solution

  - Find a minimum length solution
][
  #align(center, scale(110%, plot_sol))
]

#new-section("Solution")

#slide(title: "Simplifying the problem")[
  - Transform into a graph problem

  - Let $n_0, ..., n_(n-1)$ be the input nodes

  - We can compute the allowed edges $e_0, ..., e_(m-1)$
  // TODO: Bound on m?
    
  - We can compute the pairs of crossing edges $(e_i, e_j), (e_h, e_k) ...$

  - Goal: find a spanning tree without crossing edges
]

#slide(title: "SAT formulation")[
  - Variables $e_i$ for all edges $e_i$

  - True if and only if $e_i$ is selected in the solution

  - $not e_i or not e_j$ for all pair of crossing edges $(e_i, e_j)$
]

#slide(title: "Properties of spanning trees")[
  - Any two of these properties implies the third
    #v(0.5em)

    - All nodes are connected

    - There are no cycles

    - There are exactly $n - 1$ edges
]

#slide(title: [ Requiring exactly $n-1$ edges ])[
  - Every edge connects a child to a parent

  - Every node except the root has exactly one edge that connects it to its parent
][
  #tree_full
]

#slide(title: "SAT formulation")[
  - Variables $c_(i j)$ for all $n_i$, $n_j$ connected by an edge
  // TODO: number of variables

  - True if and only if $n_i$ is a child of $n_j$ in the solution

  - $e_i arrow.l.r c_(j k) or c_(k j)$ for all $e_i$ connecting $n_j$ and $n_k$
]

#slide(title: "SAT Formulation")[
  - Let $N_i = { n_j | exists e_k. e_k = (n_i, n_j) or e_k = (n_j, n_i) }$

  - $not c_(0 i)$ for all $n_i$ in $N_0$

  - $display(or.big_(n_j in N_i)) c_(i j)$ for all $n_i$ where $i != 0$

  - $not c_(i j) or not c_(i k)$ for all combinations of $n_j$, $n_k$ in $N_i$ where $i != 0$
]

#slide(title: "Preventing cycles")[
  - "Under" relation

    - Every child is under its parent

    - Irreflexive

    - Transitive

  - Every child has exactly one parent
][
  #tree_cycle
]

#slide(title: "SAT Formulation")[
  - Variables $u_(i j)$ for all $n_i$ and $n_j$

  - True if $n_i$ is under $n_j$ in the solution tree

  - $c_(i j) -> u_(i j)$ for all $n_i$, $n_j$ connected by an edge

  - $not u_(i i)$ for all $n_i$

  - $u_(i j) and u_(j k) -> u_(i k)$ for all $n_i$, $n_j$ and $n_k$

      - Optimization: $c_(i j) and u_(j k) -> u_(i k)$
]

#slide(title: "Minimum length solution")[
  - Max-SAT

  - Maximize the negation of the total length

  - Add soft clauses: $e_i: -l_i$ where $l_i$ is the length of $e_i$
]

#slide(theme-variant: "full")[
  Demo
]

#slide(theme-variant: "end")[
  Thank you for your attention
]
