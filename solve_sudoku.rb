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
  # extend NakedSingles

  attr_accessor :sudoku, :array, :string

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

  def self.history(line)
    @history ||= []
    @history << line
  end

  def self.history=(line)
    @history ||= []
    @history << line
  end

  def puzzle_finished?(type)
    @loops += 1

    if @loops == 25
      puts
      p "stopped after #{@loops} loops"
      print_history unless type == :test_all

    elsif valid_puzzle?(array) && no_arrays?(array)
      # array.to_a.each { |a| p a }
      puts
      history=("puzzle solved after #{@loops} recursions") # << valid_puzzle?(array)
      print_history unless type == :test_all
      print_final_puzzle(array) unless type == :test_all

    else
      solve_puzzle(type)
    end
  end

  def solve_puzzle(type = :all)
    if type == :all or type == :test_all
      naked_singles
      hidden_candidates
      naked_pairs
      naked_trips
      naked_quads

      puzzle_finished?(type)
    else
      send(type)
      print_history unless type == :test_all
      #array.to_a.each { |a| p a }
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

 sudoku = '000000300001900500560310094100600428004000709270004003040068035002005900000000000'
 puzzle = Sudoku.new(sudoku)

p puzzle.initial_string
puzzle.initial_setup
puzzle.solve_puzzle

p puzzle.final_string
