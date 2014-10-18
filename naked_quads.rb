array = [1, [4, 5, 6, 9], [4, 5, 6, 9],
         [4, 6, 7, 8], [2, 4, 6, 7, 8, 9], [4, 6, 9],
         [4, 6], [2, 4, 5, 6, 9], 3]

# naked_quad with [4, 5, 6, 9]

# should look like this after being cleared.
# array = [1, [4, 5, 6, 9], [4, 5, 6, 9],
#         [7, 8], [2, 7, 8], [4, 6, 9],
#         [4, 6], [2], 3]

p array
quad = [4, 5, 6, 9]
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
remaining_numbers = numbers - quad
p remaining_numbers
puts

x = []
array.each do |element|
  next if element.is_a?(Integer)
  if (element - quad) == []
    x << element
  end
end
p x
p x.length == quad.length
puts

# subtract quad and if it stays the same then add it to array

remaining_numbers.each do |number|
  array.each_with_index do |element, index|
    next if element.is_a?(Integer)
    if element.include?(number)
      p "before: #{element}  after: #{(element -= quad)} "
      array[index] = element

    end

  end
end

p array

def naked_quads(array)
  solve_for_boxes(array, :naked_quad)
  solve_for_rows(array, :naked_quad)
  solve_for_columns(array, :naked_quad)
end

def naked_quad?

end

def naked_quad(array, rows, columns, _location)
  
  rows.each do |row|
    columns.each do |column|

      element = array[row][column]

    end
  end
end
