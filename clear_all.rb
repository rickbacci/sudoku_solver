
def clear_all(array)
  solve_for_boxes(array, :clear_puzzle)
  solve_for_rows(array, :clear_puzzle)
  solve_for_columns(array, :clear_puzzle)

  solve_for_rows(array, :exist_only?)
  solve_for_columns(array, :exist_only?)
end


def build_temp_array(array, rows, columns)
  temp_array = []

  rows.each do |row|
    columns.each do |column|
      temp_array << array[row][column]
    end
  end
  temp_array
end

def clear_puzzle(array, rows, columns, location = nil)

  temp_array = build_temp_array(array, rows, columns)
  
  temp_array.each do |element|
    if element.is_a?(Integer)
      number = element

      temp_array.each do |value|
        next if value.is_a?(Integer)
        value.delete(number) if value.include?(number)
        # end
      end
    end
  end
end


