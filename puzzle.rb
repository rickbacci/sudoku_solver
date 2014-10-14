# require_relative 'clear'

class Puzzle
  attr_accessor :sudoku, :puzzle

  def initialize(sudoku)
    @sudoku = sudoku
    @puzzle = []
  end

  def generate_matrix
    row = []
    sudoku.each_char do |char|
      if char == '0'
        row << [1, 2, 3, 4, 5, 6, 7, 8, 9]
      else
        row << char.to_i
      end

      if row.length == 9
        puzzle << row
        row = []
      end
    end
    puzzle
  end

  def print_matrix
    puzzle.each do |p|
      p p
    end
  end
end

sudoku = '007300509300002000400080003600050030003000600090060002800030005000600004706001300'

#puzzle = Puzzle.new(sudoku)


#puzzle.print_matrix

#p puzzle.generate_matrix

#test = Clear.new(puzzle)

#p test

