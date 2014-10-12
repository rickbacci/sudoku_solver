def solve_for_two(array)
  solve_for_boxes(array, :solve_for_twos)
  solve_for_rows(array, :solve_for_twos)
  solve_for_columns(array, :solve_for_twos)
end


def solve_for_twos(array, rows, columns, _location)
  # clear_all(array)

  temp_array = build_temp_array(array, rows, columns)

 
  temp_array.each do |element|
    if element.size == 2 ## clear pairs ([1,3] and [1,3]) not pairs of 'trips'
    
      if temp_array.count(element) == 2 ## matching pair found
        pair = element
        temp_array.each do |element2|
          if element2.is_a?(Array) && pair != element2
            before = element2
            clear_value(array, rows, columns, element, element2, pair)
          end
        end
      else ## clear 'trips' ([3,4], [3,7], [3,4,7])
        temp_array.each do |element2|
          # # don't want to delete original
          if element2.size == 2 && (element2 != element)
            if temp_array.include?((element + element2).uniq.sort)
              trips = (element + element2).uniq.sort
              clear_value(array, rows, columns, element, element2, trips)
            end
          end
        end
      end
    end
  end
end

def clear_value(array, rows, columns, element, element2, value)
  rows.each do |r|
    columns.each do |c|

      if array[r][c].is_a?(Array) && clear?(array[r][c], element, element2, value)
        before = array[r][c]

        ## this needs fixed....should not be allowing matches.size > 3
        
        array[r][c] -= value if value.size <= 3
        

        if before != array[r][c]
          @history << "[#{r}][#{c}] clearing #{value}...element before: #{before}," \
                      " element after: #{array[r][c]}"
        end
      end
    end
  end
  clear_all(array)
  value = []
end


def clear?(val, el1, el2, value)
  return false if val == el1
  return false if val == el2
  return false if val == value
  true
end
