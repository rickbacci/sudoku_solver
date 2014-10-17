def build_flat_array(array, rows, columns)
  flat_array = []
  rows.each do |row|
    columns.each do |column|
      flat_array << array[row][column] if array[row][column].is_a?(Array)
    end
  end
  flat_array = flat_array.flatten
end

def solve_for_ones(array)
  solve_for_boxes(array, :solve_for_one)
  solve_for_rows(array, :solve_for_one)
  solve_for_columns(array, :solve_for_one)
end

def naked_singles(array)
  solve_for_boxes(array, :naked_single)
  solve_for_rows(array, :naked_single)
  solve_for_columns(array, :naked_single)
end

def solve_for_one(array, rows, columns, location)
  flat_array = build_flat_array(array, rows, columns)

  (1..9).each do |number|
    rows.each do |row|
      columns.each do |column|

        element = array[row][column]

        next if element.is_a?(Integer)
        if element.include?(number) # && element.size == 1
          if element.size == 1
            # if element.is_a?(Array) && element.include?(number)
            # if element.size == 1

            # array[row][column] = number

            # history << "#{location} [#{row}][#{column}] :solve_for_one__ (:_array_size_1) --- " \
            #            "set from #{element} to #{number}"

            # Common.clear_all(array)
            # return
          elsif flat_array.count(number) == 1
            
            array[row][column] = number

            history << "#{location} [#{row}][#{column}] :solve_for_one__ (:one_remaining) --- "\
                       "set from #{element} to #{number}"

            Common.clear_all(array)
            return
          end
        end
      end
    end
  end
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
      # return
    end
  end
end
