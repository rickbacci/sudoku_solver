
def solve_for_one(array)
  solve_for_boxes( array, :solve_for_ones )
  solve_for_rows( array, :solve_for_ones )
  solve_for_columns( array, :solve_for_ones )
end

def solve_for_two(array)
  solve_for_boxes( array, :solve_for_twos )
  solve_for_rows( array, :solve_for_twos )
  solve_for_columns( array, :solve_for_twos )
end

def solve_for_three(array)
  # solve_for_rows( array, :solve_for_threes )
  # solve_for_boxes( array, :solve_for_threes )
  # solve_for_columns( array, :solve_for_threes )
end

def solve_for_four(array, section)
  # solve_for_boxes( array, :solve_for_fours )
  # solve_for_rows( array, :solve_for_fours )
  # solve_for_columns( array, :solve_for_fours )
end
