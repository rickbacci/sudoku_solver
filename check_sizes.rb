
def check_sizes(array)
  @solved, @size1, @size2, @size3, @size4, @size5, @size6 = 0, 0, 0, 0, 0, 0, 0


  array.each do |row|
    row.each do |element|
      if element.size == 1 
        @size1 += 1
      elsif element.size == 2
        @size2 += 1
      elsif element.size == 3
        @size3 += 1
      elsif element.size == 4
        @size4 += 1
      elsif element.size == 5
        @size5 += 1
      elsif element.size == 6
        @size6 += 1
      else
        @solved += 1
      end
    end
  end

  lengths = [@size1, @size2, @size3, @size4, @size5, @size6]

  #p "#{@solved} numbers have been solved"
  #puts
  unless lengths.inject {|sum, num| sum + num } == 0
    lengths.each_with_index do |value, index|
      #p "There are #{value} elements with a size of #{ index + 1 }"
    end
  end
end