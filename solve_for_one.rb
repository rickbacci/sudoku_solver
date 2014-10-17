def build_flat_array(array, rows, columns)
  flat_array = []
  rows.each do |row|
    columns.each do |column|
      flat_array << array[row][column] if array[row][column].is_a?(Array)
    end
  end
  flat_array = flat_array.flatten
end

def naked_singles(array)
  solve_for_boxes(array, :naked_single)
  solve_for_rows(array, :naked_single)
  solve_for_columns(array, :naked_single)
end

def hidden_candidates(array)
  solve_for_boxes(array, :hidden_candidate)
  solve_for_rows(array, :hidden_candidate)
  solve_for_columns(array, :hidden_candidate)
end

def naked_single(array, rows, columns, location)
  rows.each do |row|
    columns.each do |column|

      element = array[row][column]
      
      next if element.is_a?(Integer)
      next if element.size != 1

      number = element[0]
      array[row][column] = number

      history << "#{location} [#{row}][#{column}] :solve_for_one__ (:_array_size_1) --- " \
                   "set from #{element} to #{number}"

      Common.clear_all(array)
      return
    end
  end
end

def hidden_candidate(array, rows, columns, location)
  (1..9).each do |number|
    rows.each do |row|
      columns.each do |column|

        element = array[row][column]
        
        next if element.is_a?(Integer)
        next if element.size == 1
        next if build_flat_array(array, rows, columns).count(number) != 1

        array[row][column] = number if element.include?(number)

        history << "#{location} [#{row}][#{column}] :solve_for_one__ (:one_remaining) --- " \
                     "set from #{element} to #{number}"

        Common.clear_all(array)
        return
      end
    end
  end
end
