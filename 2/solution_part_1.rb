def solve
  input_file = File.open '/Users/Corin/advent/2/input.txt'
  input_dimensions = input_file.read.split "\n"
  surface_areas = input_dimensions.map { |dimensions| calculate_wrapping_paper_needed dimensions }
  sum = surface_areas.reduce :+
  puts sum
end

def calculate_wrapping_paper_needed dimensions_string
  l, w, h = dimensions_string.split('x').map &:to_i
  area = 2*l*w + 2*w*h + 2*h*l

  slack = [l, w, h].sort.first(2).reduce :*

  area + slack
end

solve



