def naked_pairs(array)
  solve_for_boxes(array, :naked_pair)
  solve_for_rows(array, :naked_pair)
  solve_for_columns(array, :naked_pair)
end

def naked_pair?(pair, temp_array)
  values = []
  temp_array.each do |element|
    next if element.is_a?(Integer)
    values << element if (element - pair) == []
  end

  return pair if values.length == pair.length
  nil
end

def remaining_numbers(pair)
  [1, 2, 3, 4, 5, 6, 7, 8, 9] - pair
end

def location
  @location
end

def clear_naked_pair(array, rows, columns, pair, location)
  remaining_numbers(pair).each do |number|
    rows.each do |row|
      columns.each do |column|

        element = array[row][column]

        next unless element.is_a?(Array) && element.include?(number)

        unless element == (element - pair)
          history << "#{location} [#{row}][#{column}]       :naked_pair --- " \
                   "clearing #{pair} before: #{element} after: #{element -= pair}"
        end

        Common.clear_all(array)
        array[row][column] = element
      end
    end
  end
end

def naked_pair(array, rows, columns, location)
  temp_array = Common.build_temp_array(array, rows, columns)

  rows.each do |row|
    columns.each do |column|

      element = array[row][column]
      pair = naked_pair?(element, temp_array) if element.size == 2

      next if pair.nil?

      clear_naked_pair(array, rows, columns, pair, location)
    end
  end
end
