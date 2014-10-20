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

possible_quads = possible_combinations(array)

# puts
# possible_quads.each do |p|
#   p p.sort!
# end


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

p naked_quad?(array, possible_quads)
