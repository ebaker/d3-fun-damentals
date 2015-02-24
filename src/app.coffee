generate = {}

# list of random integers
generate.rand_ints = (count = 10, min = 1, max = 20) ->
  data = [1..count].map (i) ->
    return Math.floor(Math.random() * (max - min)) + min
