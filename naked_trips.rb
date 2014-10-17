def naked_trips(array)
  solve_for_boxes(array, :naked_trip)
  solve_for_rows(array, :naked_trip)
  solve_for_columns(array, :naked_trip)
end


def naked_trip(array, rows, columns, _location)
  temp_array = Common.build_temp_array(array, rows, columns)

  temp_array.each do |element|
    next if element.size != 2 || temp_array.count(element) != 2

    temp_array.each do |element2|
      next if element.size != 2 || temp_array.count(element) != 2

      # don't want to delete original
      if element2.size == 2 && (element2 != element)
        if temp_array.include?((element + element2).uniq.sort)
          trips = (element + element2).uniq.sort
          clear_naked_trip(array, rows, columns, element, element2, trips)
        end
      end
    end
  end
end

def clear_naked_trip(array, rows, columns, element, element2, value)
  rows.each do |r|
    columns.each do |c|

      if array[r][c].is_a?(Array) && clear?(array[r][c], element, element2, value)
        before = array[r][c]

        # this needs fixed....should not be allowing matches.size > 3
        array[r][c] -= value
        

        if before != array[r][c]
          history << "[#{r}][#{c}] clearing pair: #{value}...element before: #{before}," \
                      " element after: #{array[r][c]}"
        end
      end
    end
  end
  Common.clear_all(array)
  value = []
end


def clear?(val, el1, el2, value)
  return false if val == el1
  return false if val == el2
  return false if val == value
  true
end
