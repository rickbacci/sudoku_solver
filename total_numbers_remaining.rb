def build_hash_of_numbers_remaining(number_totals_remaining)
  hash = {}

  number_totals_remaining.each_with_index do |number, index|
    # p "There are #{number} #{index + 1}'s remaining in the puzzle"
    hash[index + 1] = number
    puts if index == 8
  end
  hash.sort { |a1, a2| a1[1] <=> a2[1] }
end

def sort_values(order)
  new_order = []

  order.each do |o|
    new_order << o[0]
  end
  new_order
end

def total_numbers_remaining?(array)
  number_totals_remaining = [0, 0, 0, 0, 0, 0, 0, 0, 0]

  array.each do |row|
    row.each do |element|
      next if element.is_a?(Integer)
      (1..9).each_with_index do |num, index|
        number_totals_remaining[index] += 1 if element.flatten.include?(num)
      end
    end
  end
  p order = build_hash_of_numbers_remaining(number_totals_remaining)
  sort_values(order)
end
