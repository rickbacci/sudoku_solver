
def set_boxes(new_puzzle)
  set_box(new_puzzle, (0..2), (0..2))
  set_box(new_puzzle, (3..5), (3..5))
  set_box(new_puzzle, (6..8), (6..8))
end

def set_box(new_puzzle, rows, columns)

  numbers = [1,2,3,4,5,6,7,8,9].shuffle!
  shuffled_numbers = []

  rows.each do |row|
    columns.each do |columns|
      shuffled_numbers << new_puzzle[row][columns] = numbers.pop
    end
  end
  shuffled_numbers
end
