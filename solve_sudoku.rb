require_relative 'puzzle/starting_matrix'
require_relative 'puzzle/set_boxes'

require_relative 'clear_all'
require_relative 'check_sizes'
require_relative 'total_numbers_remaining'
require_relative 'ranges'
require_relative 'solve_for_one'
require_relative 'solve_for_two'
require_relative 'solve_for_three'
require_relative 'solve_for_four'
require_relative 'validation'
require_relative 'puzzle/print_puzzle'
require_relative 'solve_for'
require_relative 'foo'


def initial_setup(array)

  clear_all(array)
  print_initial_puzzle(array)
  @history = []
  @loops = 0
 
  array
end


def solve_puzzle(array)
  
  #clear_all(array)
  
  #total_numbers_remaining?(array)
  check_sizes(array)
  
  #@loop_once = 0
 
  if (@size1 > 0)
    solve_for_one(array)
  elsif @size2 > 0
    solve_for_two(array)
  end
  
  done = array.flatten.inject(0) { |total, value| total + value }
  @loops += 1

  if @loops == 50
    puts
    p "stopped after #{@loops} loops"
    return
  elsif done == 405 && no_arrays?(array)
    @history << "puzzle solved after #{@loops} recursions"
    return
  else
    solve_puzzle(array)
  end
end


  array = starting_matrix
  
  initial_setup(array)
  solve_puzzle(array)

  @history << valid_puzzle?(array)

  print_history
  print_final_puzzle(array)


