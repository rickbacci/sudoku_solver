def naked_quads(array)
  solve_for_boxes(array, :naked_quad)
  solve_for_rows(array, :naked_quad)
  solve_for_columns(array, :naked_quad)
end

def possible_combinations(array)
  quads = []
  array.each do |arr|
    next if arr.is_a?(Integer)
    array.each do |val|
      next if val.is_a?(Integer)

      quad = (arr + val).uniq
      quads << quad if quad.length == 4
    end
  end
  quads.uniq.sort
end

# possible_quads = possible_combinations(array)

def naked_quad?(array, possible_quads)
  found_quad = []
  possible_quads.each do |quad|
    array.each do |element|
      next if element.is_a?(Integer)
      found_quad << element if (element - quad) == []
    end
    
    return quad.sort if found_quad.length == 4
    found_quad = []
    nil
  end
end

# p naked_quad?(array, possible_quads)



# def naked_quad?(quad, temp_array)
#   values = []
#   temp_array.each do |element|
#     next if element.is_a?(Integer)
#     values << element if (element - quad) == []
#   end

#   return quad if values.length == quad.length
#   nil
# end

def remaining_numbers(quad)
  [1, 2, 3, 4, 5, 6, 7, 8, 9] - quad
end

def location
  @location
end

def clear_naked_quad(array, rows, columns, quad, location)
  remaining_numbers(quad).each do |number|
    rows.each do |row|
      columns.each do |column|

        element = array[row][column]

        next unless element.is_a?(Array) && element.include?(number)

        unless element == (element - quad)
          history << "#{location} [#{row}][#{column}]       :naked_quad --- " \
                   "clearing #{quad} before: #{element} after: #{element -= quad}"
        end

        Common.clear_all(array)
        array[row][column] = element
      end
    end
  end
end

def naked_quad(array, rows, columns, location)
  temp_array = Common.build_temp_array(array, rows, columns)
  possible_quads = possible_combinations(temp_array)

  # [2, 4, 5, 7]
  # [8, [1, 6, 7], [4, 5], [3, 5, 6], [2, 3, 7, 9], [2, 5, 7], [2, 7], [1, 9], [4, 7]]
  rows.each do |row|
    columns.each do |column|

      #element = array[row][column]
      quad = naked_quad?(temp_array, possible_quads) # if element.size == 4

      next if quad.nil?

      clear_naked_quad(array, rows, columns, quad, location)
    end
  end
end

