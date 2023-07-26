#let unit = 100pt

#let tree(dots, arrows, dash) = {
  box(width: 3 * unit, height: 2 * unit)[
    #for (x, y) in dots {
      place(dx: x*unit - 4pt, dy: y*unit - 4pt, circle(radius: 4pt, fill: black))
    }
    #for (s, e) in arrows {
      let (sx, sy) = dots.at(s)
      let (ex, ey) = dots.at(e)
      place(line(
        start: (sx * unit, sy * unit), end: (ex * unit, ey * unit),
        stroke: (dash: dash)
      ))
      let angle = calc.atan2(ex - sx, ey - sy)
      place(line(
        start: (sx * unit, sy * unit), angle: angle + 30deg, length: 10pt,
        stroke: (dash: dash)
      ))
      place(line(
        start: (sx * unit, sy * unit), angle: angle - 30deg, length: 10pt,
        stroke: (dash: dash)
      ))
    }
  ]
}

#let tree_dots = ((1.5, 0), (0.5, 1), (2.5, 1), (0, 2), (1, 2), (2, 2), (3, 2))
#let tree_arrows = ((1, 0), (2, 0), (3, 1), (4, 1), (5, 2), (6, 2))

#let tree_full = tree(tree_dots, tree_arrows, "solid")

#let tree_arrows_dotted = ((2, 0), (3, 1), (5, 2), (6, 2))
#let tree_arrows_solid = ((1, 0), (4, 1))

#let tree_cycle = {
  let stroke = (paint: red, thickness: 2pt)
  place(path(
    ((1 * unit, 2 * unit), (-0.35 * unit, 0.35 * unit)),
    ((1.5 * unit, 1 * unit), (0pt, 0.5 * unit)),
    (1.5 * unit, 0pt),
    stroke: stroke,
  ))
  place(line(start: (1.5 * unit, 2pt), angle: 120deg, length: 10pt, stroke: stroke))
  place(line(start: (1.5 * unit, 2pt), angle: 60deg, length: 10pt, stroke: stroke))
  place(tree(tree_dots, tree_arrows_solid, "solid"))
  tree(tree_dots, tree_arrows_dotted, "dotted")
}
