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

class Sudoku
  # extend Common
  attr_accessor :sudoku, :array, :history, :string, :area

  def initialize(sudoku)
    @sudoku = sudoku
    @array = Matrix.new.generate_matrix(sudoku)
    @loops = 0
    @history = []
    @string = ''
  end

  def initial_setup
    Common.clear_all(array)
    print_initial_puzzle(array)
  end

  def initial_string
    @sudoku
  end

  def self.history
    @history ||= []
  end

  def puzzle_finished?
    @loops += 1

    if @loops == 25
      puts
      p "stopped after #{@loops} loops"
      print_history

    elsif valid_puzzle?(array) && no_arrays?(array)
      array.to_a.each { |a| p a }
      puts
      @history << "puzzle solved after #{@loops} recursions" # << valid_puzzle?(array)
      print_history
      print_final_puzzle(@array)

    else
      solve_puzzle(:all)
    end
  end

  def solve_puzzle(area = :all)
    if area == :all
      naked_singles
      hidden_candidates
      naked_pairs
      naked_trips
      naked_quads

      puzzle_finished?
    else
      send(area)
      print_history
      array.to_a.each { |a| p a }
    end
  end

  def final_string
    array.each do |value|
      value.each do |val|
        if val.is_a?(Integer)
          string << val.to_s
        else
          string << '0'
        end
      end
    end
    string
  end
end

 #SUDOKU = '000000300001900500560310094100600428004000709270004003040068035002005900000000000'
 puzzle = Sudoku.new(SUDOKU)

# puzzle = Sudoku.new('000000300001900500560310094100600428004000709270004003040068035002005900000000000')

p puzzle.initial_string
puzzle.initial_setup
puzzle.solve_puzzle(:hidden_candidates)

p puzzle.final_string


