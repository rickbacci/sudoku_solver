
def print_final_puzzle(array)
    array.each_with_index do |row, row_num|
      row.each_with_index do |element, col_num|
      end
    end

  puts "-------------------"

  (0..8).each do |row|
    puts  "| " + array[row][0].to_s + array[row][1].to_s + array[row][2].to_s + 
         " | " + array[row][3].to_s + array[row][4].to_s + array[row][5].to_s + 
         " | " + array[row][6].to_s + array[row][7].to_s + array[row][8].to_s + " |"

    puts "-------------------" if row == 2 || row == 5

  end
  puts "-------------------"
end

def print_initial_puzzle(array)
  puts
  array.each { |puzzle| p puzzle }
  puts
end

def print_history
  @history.each { |h| p h } 
  puts
end

def save_history(location, row, column, element, new_value, method, reason)

  @history << "#{location} [#{row}][#{column}] #{method} (#{reason}) --- " + 
  " set from #{element} to #{new_value}"
  #{}"Box2 finished? #{box_finished?(@box2)} --- set from #{element} to #{new_value}"
  #@box2finished += 1 if box_finished?(@box2) == false
end