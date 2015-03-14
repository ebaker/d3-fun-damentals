w = 400
h = 400
r = h / 2
color = d3.scale.category10()

data = [
  {label: 'Category A', value: 20}
  {label: 'Category B', value: 30}
  {label: 'Category C', value: 50}
]

chart = d3.select('body').append('svg').data([data])
  .attr('width', w)
  .attr('height', h)
  .append('g')
  .attr 'transform', "translate(#{r}, #{r})"

pie = d3.layout.pie().value (d) -> return d.value
arc = d3.svg.arc().outerRadius(r)

# create slices
arcs = chart.selectAll('g.slice')
  .data(pie)
  .enter().append('g')
  .attr 'class', (d, i) ->
    return "#{i} slice"

# draw with arc generator
arcs.append('path')
  .attr('fill', (d, i) -> return color(i))
  .attr 'd', (d) -> arc(d)

# add text
arcs.append('text').attr('transform', (d) ->
  d.innerRadius = 0
  d.outerRadius = r
  return "translate(#{arc.centroid(d)})"
).attr('text-anchor', 'middle').text (d, i) ->
  return data[i].label
