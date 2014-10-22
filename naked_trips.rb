def naked_trips
  solve_for_boxes(array, :naked_trip)
  solve_for_rows(array, :naked_trip)
  solve_for_columns(array, :naked_trip)
end

def naked_trip?(trip, temp_array)
  values = []
  temp_array.each do |element|
    next if element.is_a?(Integer)
    values << element if (element - trip) == []
  end

  return trip if values.length == trip.length
  nil
end

def remaining_numbers(trip)
  [1, 2, 3, 4, 5, 6, 7, 8, 9] - trip
end

def location
  @location
end

def clear_naked_trip(array, rows, columns, trip, location)
  remaining_numbers(trip).each do |number|
    rows.each do |row|
      columns.each do |column|

        element = array[row][column]

        next unless element.is_a?(Array) && element.include?(number)

        unless element == (element - trip)
          @history << "#{location} [#{row}][#{column}]       :naked_trip --- " \
                   "clearing #{trip} before: #{element} after: #{element -= trip}"
        end

        Common.clear_all(array)
        array[row][column] = element
      end
    end
  end
end

def naked_trip(array, rows, columns, location)
  temp_array = Common.build_temp_array(array, rows, columns)

  rows.each do |row|
    columns.each do |column|

      element = array[row][column]
      trip = naked_trip?(element, temp_array) if element.size == 3

      next if trip.nil?

      clear_naked_trip(array, rows, columns, trip, location)
    end
  end
end
