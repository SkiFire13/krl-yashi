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

  - No crossing segments

  - No cycles
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
  - Let $n_1, ..., n_n$ be the input nodes

  - We can compute the allowed edges $e_1, ..., e_m$
  // TODO: Bound on m?
    
  - We can compute the pairs of crossing edges $(e_i, e_j), (e_h, e_k) ...$
]

#slide(title: "SAT formulation")[
  - Variables $e_i$ for all $e_i$

  - True if and only if $e_i$ is selected in the solution

  - $not e_i or not e_j$ for all pair of crossing edges $(e_i, e_j)$
]

#slide(title: "Properties of the solution")[
  - The game requires:

    - all nodes to be connected

    - no cycles to be present

  - True if and only if the solution is a spanning tree
]

#slide(title: "Properties of spanning trees")[
  - Any two of these properties implies the third
    #v(0.5em)

    - All nodes are connected

    - There are no cycles

    - There are exactly $n - 1$ edges
]

#slide(title: [ Requiring $n-1$ edges ])[
  - Every edge connects a child to a parent

  - Every node except the root has exactly one edge that connects it to its parent
][
  #tree_full
]

#slide(title: "SAT formulation")[
  - Which endpoint is the child and which the parent?

  - Variables $c_(i j)$ for all $n_i$, $n_j$ connected by an edge
  // TODO: number of variables

  - True if and only if $n_i$ is a child of $n_j$ in the solution

  - $e_i arrow.l.r c_(j k) or c_(k j)$ for all $e_i$ connecting $n_j$ and $n_k$
]

#slide(title: "SAT Formulation")[
  - $not c_(1 i)$ for all $n_i$

  - Let $E_i = { e_j | exists n_k. e_j = (n_i, n_k) or e_j = (n_k, n_i) }$

  - $display(or.big_(e_j in E_i)) e_j$ for all $n_i$

  - $not e_j or not e_k$ for all combinations of $e_j$, $e_k$ in $E_i$
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

// #slide(title: "Preventing cycles")[
//   - Consider a cycle and pick an edge

//   - It connects a child $n_j$ to its parent $n_i$, so $n_j$ is under $n_i$

//   - The next edge must connect to $n_k$ child of $n_j$

//   - Thus $n_k$ is under $n_j$ and by transitivity under $n_i$

//   - And so on, every other node of the cycle is under $n_i$ 

//   - The cycle must close, so $n_i$ is under itself, contradiction
// ]

#slide(title: "SAT Formulation")[
  - variables $u_(i j)$ for all $n_i$ and $n_j$

  - true if $n_i$ is under $n_j$ in the solution tree

  - $c_(i j) -> u_(i j)$ for all $n_i$, $n_j$ connected by an edge

  - $not u_(i i)$ for all $n_i$

  - $u_(i j) and u_(j k) -> u_(i k)$ for all $n_i$, $n_j$ and $n_k$
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
