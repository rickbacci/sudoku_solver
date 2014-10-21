def naked_quads(array)
  solve_for_boxes(array, :naked_quad)
  solve_for_rows(array, :naked_quad)
  solve_for_columns(array, :naked_quad)
end

def possible_combinations(array)
  quads = []
  array.each do |arr|
    next if arr.is_a?(Integer)
    array.each do |val|
      next if val.is_a?(Integer)

      quad = (arr + val).uniq
      quads << quad if quad.length == 4
    end 
  end 
  quads.uniq.sort     
end     
 
def naked_quad?(array, possible_quads)
  found_quad = []
  possible_quads.each do |quad|
    array.each do |element|
      next if element.is_a?(Integer)
      found_quad << element if (element - quad) == []
    end
    
    return quad.sort if found_quad.length == 4
    found_quad = []
    nil
  end
end

def remaining_numbers(quad)
  [1, 2, 3, 4, 5, 6, 7, 8, 9] - quad
end

def location
  @location
end

def clear_naked_quad(array, rows, columns, quad, location)
  remaining_numbers(quad).each do |number|
    rows.each do |row|
      columns.each do |column|

        element = array[row][column]

        next unless element.is_a?(Array) && element.include?(number)

        unless element == (element - quad)
          history << "#{location} [#{row}][#{column}]       :naked_quad --- " \
                   "clearing #{quad} before: #{element} after: #{element -= quad}"
        end

        Common.clear_all(array)
        array[row][column] = element
      end
    end
  end
end

def naked_quad(array, rows, columns, location)
  temp_array = Common.build_temp_array(array, rows, columns)
  possible_quads = possible_combinations(temp_array)

  quad = naked_quad?(temp_array, possible_quads)

  clear_naked_quad(array, rows, columns, quad, location) unless quad.nil?
end

