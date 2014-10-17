def hidden_candidates(array)
  solve_for_boxes(array, :hidden_candidate)
  solve_for_rows(array, :hidden_candidate)
  solve_for_columns(array, :hidden_candidate)
end

def hidden_candidate(array, rows, columns, location)
  (1..9).each do |number|
    rows.each do |row|
      columns.each do |column|

        element = array[row][column]
        
        next if element.is_a?(Integer) || element.size == 1
        next if Common.build_flat_array(array, rows, columns).count(number) != 1

        array[row][column] = number if element.include?(number)

        history << "#{location} [#{row}][#{column}] :solve_for_one__ (:one_remaining) --- " \
                     "set from #{element} to #{number}"

        Common.clear_all(array)
      end
    end
  end
end