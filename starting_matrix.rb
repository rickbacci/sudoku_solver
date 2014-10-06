#sudoku = '160379048000000000030481070310507089580602037000000000000000000040020050003964800'
#sudoku = '020001089108003004060700000000000200500607003003000000000004030700900401940100070'

def generate_matrix string
  puzzle = []
  row = []
  string.each_char do |char|
    if char == "0"
      row << [1,2,3,4,5,6,7,8,9]
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