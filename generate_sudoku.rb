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


def initial_setup(new_puzzle)
  #set_boxes(new_puzzle)
  clear_all(new_puzzle)
  print_initial_puzzle(new_puzzle)
  @history = []
  @loops = 0
  #@pairs = []
  #@box2finished = 0
  @other_path = 0
  new_puzzle
end


def generate_puzzle(array)
  
  clear_all(array)
  
  total_numbers_remaining?(array)
  check_sizes(array)
  
  @loop_once = 0
 
  if (@size1 > 0) || @number_totals_remaining.include?(1)
    solve_for_one(array)
  elsif @size2 > 0
    solve_for_two(array)
  elsif @size3 > 0
    solve_for_three(array)
  else
    solve_for_four(array)
  end
  
  done = array.flatten.inject(0) { |total, value| total + value }
  @loops += 1

  if @loops == 5
    #@loops = 0
    puts
    p "#{@loops} loops"
    puts
     # @new_puzzle = starting_matrix
     # initial_setup(@new_puzzle)
     # generate_puzzle(@new_puzzle)
    return
  
  elsif done == 405 && no_arrays?(array)
    @history << "box2 not finished for #{@box2finished} loops"
    @history << "puzzle solved after #{@loops} recursions"
    @pairs = []
    @box2finished = 0
    puts
    return
  else
    generate_puzzle(array)
    array
  end
end


@saved_puzzles = []
@failed_puzzles = []
@valid_total = 0
@failed_total = 0



amount = 1

amount.times do

  @new_puzzle = starting_matrix
  
  possibly_bad_puzzle = initial_setup(@new_puzzle)

  generate_puzzle(@new_puzzle)

  @history << valid_puzzle?(@new_puzzle)

  print_history
  print_final_puzzle(@new_puzzle)

  if !valid_puzzle?(@new_puzzle) || !no_arrays?(@new_puzzle)
    @failed_total += 1
    @failed_puzzles << possibly_bad_puzzle
    
  end

  if  valid_puzzle?(@new_puzzle) && no_arrays?(@new_puzzle)
    @valid_total += 1
    @saved_puzzles << @new_puzzle
  end
end

