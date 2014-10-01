def solve_for_threes(arrays, rows, columns, location)
  clear_all(arrays)

  arrays.each_with_index do |array, row|
    array.each_with_index do |element, column|
      if element.is_a?(Array)
        if (element.size == 3) && @loop_once == 0

          new_value = element[0]

          arrays[row][column] = new_value
          save_history(location, row, column, element, new_value, :solve_for_three, "*** guess ***")
          @loop_once = 1
          clear_all(arrays)
          return
        end    
      end
    end
  end
end
