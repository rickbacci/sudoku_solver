def hidden_candidates
  solve_for_boxes(array, :hidden_candidate)
  solve_for_rows(array, :hidden_candidate)
  solve_for_columns(array, :hidden_candidate)
end

def hidden_candidate(array, rows, columns, location)
  number = Common.hidden_candidate?(array, rows, columns)
  return if number.nil?
  rows.each do |row|
    columns.each do |column|

      element = array[row][column]
      
      next if element.is_a?(Integer) || element.size == 1

      if element.include?(number)
        array[row][column] = number

        @history << "#{location} [#{row}][#{column}] :hidden_candidate --- " \
                   "set from #{element} to #{number}"
        Common.clear_all(array)
      end
    end
  end
end
