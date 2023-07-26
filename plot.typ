#let plot(nodes, edges) = {
  let n = calc.max(..nodes.map(n => n.at(0))) - 1
  
  let unit = 35pt
  let pad = 15pt

  box(width: n * unit + 3 * pad, height: n * unit + 3 * pad)[
    #let offset = 2 * pad - unit
    #place(top + left, dx: offset, dy: -offset)[
      #for (nx, ny) in nodes {
        place(
          bottom + left,
          dx: nx * unit - 4pt,
          dy: - ny * unit + 4pt,
          circle(radius: 4pt, fill: black)
        )
      }
      #for (ns, ne) in edges {
        let (nsx, nsy) = nodes.at(ns)
        let (nex, ney) = nodes.at(ne)
        place(
          bottom + left,
          dx: nsx * unit,
          dy: - nsy * unit,
          line(end: ((nex - nsx) * unit, (nsy - ney) * unit))
        )
      }
    ]
    #for i in range(n+1) {
      place(
        top + left,
        dx: pad,
        dy: pad + i * unit,
        line(
          end: (n * unit + 2 * pad, 0pt),
          stroke: (dash: "dotted")
        )
      )
      place(
        top + left,
        dx: 2 * pad + i * unit,
        dy: 0pt,
        line(
          end: (0pt, 2 * pad + n * unit),
          stroke: (dash: "dotted")
        )
      )
      place(
        top + left,
        dx: pad + i * unit,
        dy: (n + 1) * unit,
        box(width: 2 * pad, align(center, text(size: 11pt, str(i+1))))
      )
      place(
        bottom + left,
        dy: - i * unit - pad,
        box(
          width: pad, height: 2 * pad,
          align(center + horizon, text(size: 11pt, str(i+1)))
        )
      )
    }

    #let size = n * unit + 2 * pad
    #let rect = rect(width: size, height: size, inset: -pad, stroke: black)
    #place(bottom + left, dx: pad, dy: -pad, rect)
  ]
}

#let nodes = ((1, 1), (1, 7), (2, 2), (2, 4), (3, 5), (4, 1), (4, 4), (5, 5), (5, 7), (6, 2), (6, 4), (6, 6), (7, 1), (7, 3), (7, 5))
// #let edges = ((0, 1), (0, 5), (1, 8), (2, 3), (2, 9), (3, 6), (4, 7), (5, 6), (5, 12), (6, 10), (7, 8), (7, 14), (9, 10), (10, 11), (12, 13), (13, 14))
#let sol_edges = ((0, 1), (0, 5), (1, 8), (2, 3), (3, 6), (4, 7), (5, 6), (5, 12), (6, 10), (7, 8), (9, 10), (10, 11), (12, 13), (13, 14))

#let plot_empty = plot(nodes, ())
#let plot_sol = plot(nodes, sol_edges)
