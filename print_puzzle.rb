
def print_initial_puzzle(array)
  puts
  array.each { |puzzle| p puzzle }
  puts
end

def print_final_puzzle(array)

  puts '-------------------'

  (0..8).each do |row|

    puts '| ' + array[row][0].to_s + array[row][1].to_s + array[row][2].to_s +
        ' | ' + array[row][3].to_s + array[row][4].to_s + array[row][5].to_s +
        ' | ' + array[row][6].to_s + array[row][7].to_s + array[row][8].to_s + ' |'

    puts '-------------------' if row == 2 || row == 5

  end
  puts '-------------------'
end

def print_history
  history.each { |h| p h }
  puts
end
