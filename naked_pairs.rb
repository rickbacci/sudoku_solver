def naked_pairs(array)
  solve_for_boxes(array, :naked_pair)
  solve_for_rows(array, :naked_pair)
  solve_for_columns(array, :naked_pair)
end

def naked_pair(array, rows, columns, location)
  temp_array = Common.build_temp_array(array, rows, columns)

  temp_array.each do |element|
    next if element.size != 2 || temp_array.count(element) != 2
    pair = element
    temp_array.each do |element2|
      if element2.is_a?(Array) && pair != element2
        before = element2
        clear_naked_pair(location, array, rows, columns, element, element2, pair)
      end
    end
  end
end

def clear_naked_pair(location, array, rows, columns, element, element2, value)
  rows.each do |r|
    columns.each do |c|

      if array[r][c].is_a?(Array) && clear?(array[r][c], element, element2, value)
        before = array[r][c]

        # this needs fixed....should not be allowing matches.size > 3
        array[r][c] -= value
        Common.clear_all(array)


        if before != array[r][c]
          history << "#{location} [#{r}][#{c}]       :naked_pair --- clearing #{value} " \
                      "before: #{before}, element after: #{array[r][c]}"
        end
      end
    end
  end
  # Common.clear_all(array)
  value = [] # why?
end

def clear?(val, el1, el2, value)
  return false if val == el1
  return false if val == el2
  return false if val == value
  true
end
