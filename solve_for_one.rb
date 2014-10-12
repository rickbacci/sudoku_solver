def build_flat_array(array, rows, columns)
  flat_array = []
  rows.each do |row|
    columns.each do |column|
      flat_array << array[row][column] if array[row][column].is_a?(Array)
    end
  end
  flat_array = flat_array.flatten
end

def solve_for_one(array)
  solve_for_boxes(array, :solve_for_ones)
  solve_for_rows(array, :solve_for_ones)
  solve_for_columns(array, :solve_for_ones)
end

def solve_for_ones(array, rows, columns, location)
  # clear_all(array)

  flat_array = build_flat_array(array, rows, columns)

  total_numbers_remaining?(array).each do |number|
    rows.each do |row|
      columns.each do |column|

        element = array[row][column]

        if element.is_a?(Array) && element.include?(number)
          if element.size == 1
            new_value = number
            array[row][column] = new_value
            save_history(location, row, column, element, new_value, :solve_for_one__, :_array_size_1)
            
            @loop_once = 1
            clear_all(array)
            return
          elsif flat_array.count(number) == 1
            new_value = number
            array[row][column] = new_value
            save_history(location, row, column, element, new_value, :solve_for_one__, :one_remaining)

            @loop_once = 1
            clear_all(array)
            return
          end
        end
      end
    end
  end
end
