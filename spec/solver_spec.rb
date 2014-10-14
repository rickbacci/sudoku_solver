# require_relative 'spec_helper'
require_relative '../generate_matrix'


describe 'the matrix' do
  it 'has a certain length' do
    SUDOKU.length.should == 81
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



