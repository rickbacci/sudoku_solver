require_relative 'generate_matrix'
require_relative 'common'
require_relative 'ranges'

require_relative 'naked_singles'
require_relative 'hidden_candidates'
require_relative 'naked_pairs'
require_relative 'naked_trips'
require_relative 'naked_quads'
 
require_relative 'foo'
 
require_relative 'validation'
require_relative 'print_puzzle'



def initial_setup(array)
  Common.clear_all(array)
  print_initial_puzzle(array)
  @loops = 0
  
  array
end

def history
  @history ||= []
end

def puzzle_finished?(array)
  @loops += 1

  if @loops == 25
    puts
    p "stopped after #{@loops} loops"
  elsif valid_puzzle?(array) && no_arrays?(array)
    @history << "puzzle solved after #{@loops} recursions" << valid_puzzle?(array)
  else
    solve_puzzle(array)
  end
end

def solve_puzzle(array)
  naked_singles(array)
  hidden_candidates(array)

  naked_pairs(array)
  naked_trips(array)
  naked_quads(array)

  puzzle_finished?(array)
end

array = Matrix.new.generate_matrix(SUDOKU)

initial_setup(array)
solve_puzzle(array)
print_history
print_final_puzzle(array)

Common.clear_all(array)


def string
  @string
end

@string = ''
array.each do |value|
  value.each do |val|
    if val.is_a?(Integer)
      @string << val.to_s
    else
      @string << '0'
    end
  end
end
p @string
