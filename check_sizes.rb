
def count_individual_sizes(element)
  (1..4).each do |val|
    if element.size == val
      v = "@size#{val}"
      v += 1
      instance_variable_set("@size#{val}", v)
      # size = "@size#{val}"
      # size += 1
    else
      p 'error checking sizes'
    end
  end
end

# a.instance_variable_set("@hello", 7)

def check_sizes(array)
  @size1, @size2, @size3, @size4, @size5, @size6 = 0, 0, 0, 0, 0, 0

  array.each do |row|
    row.each do |element|
      count_individual_sizes(element)
    end
  end
end