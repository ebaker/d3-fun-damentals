# svg bar chart
# http://bost.ocks.org/mike/bar/2/

width = 420
bar_height = 20
min = 1
max = 20
data = generate.rand_ints 10, min, max

x = d3.scale.linear()
  .domain([min, d3.max(data)])
  .range [0, width]

chart = d3.select('body')
  .append('svg')
  .attr('class', 'chart')
  .attr('width', width)
  .attr 'height', (bar_height * data.length)

bar = chart.selectAll('g')
  .data(data)
  .enter().append('g')
  .attr 'transform', (d, i) ->
    return "translate(0, #{i * bar_height})"

bar.append('rect')
  .attr('width', x)
  .attr 'height', (bar_height - 1)

bar.append('text')
  .attr('x', (d) -> x(d) - 3)
  .attr('y', bar_height / 2)
  .attr('dy', '.35em')
  .text (d) -> return d
