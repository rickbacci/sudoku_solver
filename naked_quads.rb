# array = [1, [4, 5, 6, 9], [4, 5, 6, 9],
#          [4, 6, 7, 8], [2, 4, 6, 7, 8, 9], [4, 6, 9],
#          [4, 6], [2, 4, 5, 6, 9], 3]

# # naked_quad with [4, 5, 6, 9]

# # should look like this after being cleared.
# # array = [1, [4, 5, 6, 9], [4, 5, 6, 9],
# #         [7, 8], [2, 7, 8], [4, 6, 9],
# #         [4, 6], [2], 3]

# p array
# quad = [4, 5, 6, 9]
# numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
# remaining_numbers = numbers - quad
# p remaining_numbers
# puts

# x = []
# array.each do |element|
#   next if element.is_a?(Integer)
#   if (element - quad) == []
#     x << element
#   end
# end
# p x
# p x.length == quad.length
# puts

# # subtract quad and if it stays the same then add it to array

# remaining_numbers.each do |number|
#   array.each_with_index do |element, index|
#     next if element.is_a?(Integer)
#     if element.include?(number)
#       p "before: #{element}  after: #{(element -= quad)} "
#       array[index] = element

#     end

#   end
# end

# p array

def naked_quads(array)
  solve_for_boxes(array, :naked_quad)
  solve_for_rows(array, :naked_quad)
  solve_for_columns(array, :naked_quad)
end

def naked_quad?(quad, temp_array)
  values = []
  temp_array.each do |element|
    next if element.is_a?(Integer)
    values << element if (element - quad) == []
  end

  return quad if values.length == quad.length
  nil
end

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

  rows.each do |row|
    columns.each do |column|

      element = array[row][column]
      quad = naked_quad?(element, temp_array) if element.size == 4

      next if quad.nil?

      clear_naked_quad(array, rows, columns, quad, location)
    end
  end
end
