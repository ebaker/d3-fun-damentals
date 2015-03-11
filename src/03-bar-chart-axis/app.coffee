# svg bar chart
# http://bost.ocks.org/mike/bar/3/

min = 1
max = 20
data = generate.rand_ints 10, min, max

margin = {top: 20, right: 30, bottom: 30, left: 40}
width = 420 - margin.left - margin.right
height = 45 * data.length - margin.top - margin.bottom
bar_width = width / data.length

x = d3.scale.ordinal()
  .domain([0..data.length-1])
  .rangeBands [0, width]

y = d3.scale.linear()
  .domain([0, max])
  .range [height, 0]

chart = d3.select('body')
  .append('svg')
  .attr('class', 'chart')
  .attr('width', width + margin.left + margin.right)
  .attr('height', (height + margin.top + margin.bottom))
  .append('g')
  .attr 'transform', "translate(#{margin.left}, #{margin.right})"

bar = chart.selectAll('g')
  .data(data)
  .enter().append('g')
  .attr 'transform', (d, i) ->
    return "translate(#{i * bar_width + 1}, 0)"

bar.append('rect')
  .attr('y', (d) -> return y(d))
  .attr('height', (d) -> return height - y(d))
  .attr 'width', bar_width - 2

x_axis = d3.svg.axis()
  .scale(x)
  .orient 'bottom'

y_axis = d3.svg.axis()
  .scale(y)
  .orient('left')
  .tickValues([0..max])

chart.append('g')
  .attr('class', 'x axis')
  .attr('transform', "translate(0, #{height})")
  .call x_axis

chart.append('g')
  .attr('class', 'y axis')
  .call(y_axis)
