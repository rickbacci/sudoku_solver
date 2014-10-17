def naked_singles(array)
  # solve_for_boxes(array, :naked_single)
  solve_for_rows(array, :naked_single)
  # solve_for_columns(array, :naked_single)
end



def naked_single(array, rows, columns, location)
  rows.each do |row|
    columns.each do |column|

      element = array[row][column]
      
      next if element.is_a?(Integer) || element.size != 1

      number = element[0]
      array[row][column] = number

      history << "#{location} [#{row}][#{column}]     :naked_single --- " \
                   "set from #{element} to #{number}"

      Common.clear_all(array)
    end
  end
end


