# naked quad -- 4 uniq numbers in 4 individual elements in a row, col, or box.
# does not have to have 4 numbers in one element!

# [2, 4, 5, 7]
# [8, [1, 6, 7], [4, 5], [3, 5, 6], [2, 3, 7, 9], [2, 5, 7], [2, 7], [1, 9], [4, 7]]

array = [8, [1, 6, 7], [4, 5], [3, 5, 6], [2, 3, 7, 9], [2, 5, 7], [2, 7], [1, 9], [4, 7]]

# p ([4,5] + [1,6,7]).uniq
# p ([4,5] + [3,5,6]).uniq
# p ([4,5] + [2,3,7,9]).uniq
# p ([4,5] + [2, 5, 7]).uniq
# p ([4,5] + [2, 7]).uniq
# p ([4,5] + [1, 9]).uniq
# p ([4,5] + [4, 7]).uniq

quads = []
array.each do |arr|
  next if arr.is_a?(Integer)
  array.each do |val|
    next if val.is_a?(Integer)

    quad = (arr + val).uniq
    quads << quad if quad.length == 4
  end
end
p possible_quads = quads.uniq.sort!
puts
possible_quads.each do |p|
  p p.sort!
end

puts
found_quad = []
possible_quads.each do |quad|
  array.each do |element|
    next if element.is_a?(Integer)
    found_quad << element if (element - quad) == []
  end
  if found_quad.length == 4
    p found_quad
    p quad
  end
  found_quad = []
end

  