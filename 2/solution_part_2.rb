def solve
  input_file = File.open '/Users/Corin/advent/2/input.txt'
  input_dimensions = input_file.read.split "\n"
  ribbon_needed = input_dimensions.map { |dimensions| calculate_ribbon_needed dimensions }
  sum = ribbon_needed.reduce :+
  puts sum
end

def calculate_ribbon_needed dimensions_string
  dimensions_array = dimensions_string.split('x').map(&:to_i).sort
  volume = dimensions_array.reduce :*

  smallest, middle, biggest = dimensions_array
  smallest_perimeter = 2 * smallest + 2 * middle

  volume + smallest_perimeter
end

solve



