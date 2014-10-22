def naked_singles
  solve_for_boxes(array, :naked_single)
  solve_for_rows(array, :naked_single)
  solve_for_columns(array, :naked_single)
end



def naked_single(array, rows, columns, location)
  rows.each do |row|
    columns.each do |column|

      element = array[row][column]
      
      next if element.is_a?(Integer) || element.size != 1

      array[row][column] = element[0]

      @history << "#{location} [#{row}][#{column}]     :naked_single --- " \
                   "set from #{element} to #{element[0]}"

      Common.clear_all(array)
    end
  end
end


