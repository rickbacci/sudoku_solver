# require_relative 'spec_helper'
require_relative '../solve_sudoku'
require_relative '../generate_matrix'
require_relative '../common'
require_relative '../ranges'

require_relative '../naked_singles'
require_relative '../hidden_candidates'
require_relative '../naked_pairs'
require_relative '../naked_trips'
require_relative '../naked_quads'
 
require_relative '../foo'
 
require_relative '../validation'
require_relative '../print_puzzle'

 
describe 'the matrix' do
  it 'has a certain length' do
    puzzle = Sudoku.new(@sudoku)
    @array = Matrix.new.generate_matrix(@sudoku)
    @array.length.should == 81
  end
  
  # it 'should solve the naked_trip' do

  #   array = [7, [1, 2], [1, 4], [4, 8], [2, 8], 5, 9, 3, 6]
  # end
  

  describe 'solver should clear naked_candidates' do

    # it 'should solve the naked pair' do
    #   SUDOKU = '000000300001900500560310094100600428004000709270004003040068035002005900000000000'
    #   array = Matrix.new.generate_matrix(SUDOKU)

    #   array.should == '928547316431986572567312894195673428384251769276894153749168235612435987853729641'
    # end 

    it 'should clear the naked pairs' do
      # Sudoku.send(:remove_const, 'SUDOKU')
      SUDOKU = '000000300001900500560310094100600428004000709270004003040068035002005900000000000'
      puzzle = Sudoku.new(SUDOKU)
      puzzle.solve_puzzle()

      fs = "928547316431986572567312894195673428384251769276894153749168235612435987853729641"

      puzzle.final_string.should == fs

    end
# MyClass.send(:remove_const, 'SOME_CONSTANT')
#   MyClass::SOME_CONSTANT = [1,2,3]
#   MyClass::SOME_CONSTANT.should == [1,2,3]

    # it 'should solve the naked_trip' do


    # end

    it 'should solve the naked_quad' do
    temp_array = [8, [1, 6, 7], [4, 5], [3, 5, 6], [2, 3, 7, 9], [2, 5, 7], [2, 7], [1, 9], [4, 7]]
    possible_quads = possible_combinations(temp_array)
    @quad = naked_quad?(temp_array, possible_quads)

    quad.should == [2, 4, 5, 7]
  end

  end
    
end



# target.should equal <value>
# target.should_not equal <value>

# target.should be <value>
# target.should_not be <value>

# target.should be < 6
# target.should == 5
# target.should be_between(1, 10)
# target.should_not == 'Samantha'

# target.should match <regex>
# target.should_not match <regex>



