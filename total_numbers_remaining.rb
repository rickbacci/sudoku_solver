def total_numbers_remaining?(array)
  @number_totals_remaining = [0, 0, 0, 0, 0, 0, 0, 0, 0]

  temp_array = []

  array.each do |row|
    row.each do |element|
      unless element.is_a?(Integer)
        temp_array << element
        (1..9).each_with_index do |num, index|
          if element.flatten.include?(num)
            @number_totals_remaining[index] += 1
          end
        end
      end
    end
  end
  hash = {}

  @number_totals_remaining.each_with_index do |number, index|
    #p "There are #{number} #{index + 1}'s remaining in the puzzle"
    hash[index + 1] = number
    #puts if index == 8
  end

  order = hash.sort {|a1,a2| a1[1] <=> a2[1]}

  @new_order = []

  order.each do |o|
    @new_order << o[0]
  end
  @new_order 
end
