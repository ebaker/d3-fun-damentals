data = generate.rand_ints 10, 1, 20
console.log data

# css bar chart
d3.select('body')
  .append('h2').text('Random Bars')

d3.select('body')
  .selectAll('div')
  .data(data)
  .enter()
  .append('div')
  .attr('class', 'bar')
  .style 'height', (d) ->
    return "#{d * 7}px"

