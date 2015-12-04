# --- Day 3: Perfectly Spherical Houses in a Vacuum ---

# Santa is delivering presents to an infinite two-dimensional grid of houses.

# He begins by delivering a present to the house at his starting location, and
# then an elf at the North Pole calls him via radio and tells him where to move
# next. Moves are always exactly one house to the north (^), south (v), east
# (>), or west (<). After each move, he delivers another present to the house
# at his new location.

# However, the elf back at the north pole has had a little too much eggnog, and
# so his directions are a little off, and Santa ends up visiting some houses
# more than once. How many houses receive at least one present?

# For example:

# > delivers presents to 2 houses: one at the starting location, and one to the east.
# ^>v< delivers presents to 4 houses in a square, including twice to the house at his starting/ending location.
# ^v^v^v^v^v delivers a bunch of presents to some very lucky children at only 2 houses.

DRUNKEN_ELF_DIRECTIONS = File.open('input.txt').read.chars
NORTH, SOUTH, EAST, WEST = %w(^ v > <)

# maps coordinate pairs representing houses to present counts
# default present counts to 0
initial_map = Hash.new 0
initial_map[[0, 0]] = 1 # [Santa] begins by delivering a present to the house at his starting location

INITIAL_STATE = {
  position: [0, 0],
  map: initial_map
}

def get_next_state current_state, direction
  next_position = get_next_position current_state[:position], direction
  next_map = get_next_map current_state[:map], next_position

  {
    position: next_position,
    map: next_map
  }
end

def get_next_position current_position, direction
  x, y = current_position
  case direction
  when NORTH
    y += 1
  when SOUTH
    y -= 1
  when EAST
    x += 1
  when WEST
    x -= 1
  end

  [x, y]
end

def get_next_map current_map, next_position
  current_map[next_position] += 1
  current_map
end

FINAL_STATE = DRUNKEN_ELF_DIRECTIONS.inject INITIAL_STATE do |current_state, direction|
  get_next_state current_state, direction
end

HOUSES_WITH_PRESENTS_COUNT = FINAL_STATE[:map].size

puts "#{HOUSES_WITH_PRESENTS_COUNT} houses received at least one present on Drunken Christmas"
