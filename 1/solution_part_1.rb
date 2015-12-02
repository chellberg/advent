input_file = File.open '/Users/Corin/1/input.txt'
arr = input_file.read.split ''

current_floor = 0

arr.each_with_index do |char, index|
  if char == '('
    current_floor += 1
  else
    current_floor -= 1
  end
end

puts current_floor
