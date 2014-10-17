module Common # 'extend Common' in class

  def Common.clear_all(array)
    solve_for_boxes(array, :clear_puzzle)
    solve_for_rows(array, :clear_puzzle)
    solve_for_columns(array, :clear_puzzle)

    solve_for_rows(array, :exist_only?)
    solve_for_columns(array, :exist_only?)
  end

  def Common.clear_puzzle(array, rows, columns, _location = :none)
    temp_array = build_temp_array(array, rows, columns)
    
    temp_array.each do |element|
      next if element.is_a?(Array)

      number = element

      temp_array.each do |value|
        next if value.is_a?(Integer)
        value.delete(number) if value.include?(number)
      end
    end
  end

  def Common.build_temp_array(array, rows, columns)
    temp_array = []

    rows.each do |row|
      columns.each do |column|
        temp_array << array[row][column]
      end
    end
    temp_array
  end

  def Common.build_flat_array(array, rows, columns)
  flat_array = []
  rows.each do |row|
    columns.each do |column|
      flat_array << array[row][column] if array[row][column].is_a?(Array)
    end
  end
  flat_array = flat_array.flatten
end

  # def save_history(location, row, column, element, new_value, method, reason)
  #   history << "#{location} [#{row}][#{column}] #{method} (#{reason}) --- " \
  #              " set from #{element} to #{new_value}"
  # end

  # def add_location_to_history(location, row, column)
  #   "#{location} [#{row}][#{column}]"
  # end

  # def add_logic_to_history(method, reason)
  #   " #{method} (#{reason}) --- "
  # end

  # def add_elements_to_history(element, new_value)
  #   "set from #{element} to #{new_value}"
  # end

  # def save_history
  #   string = ''
  #   string << lambda { return add_location_to_history(location, row, column) }.call
  #   string << lambda { return add_logic_to_history(method, reason) }.call
  #   string << lambda { return add_elements_to_history(element, new_value) }
               
  #   history << string
  # end
end

