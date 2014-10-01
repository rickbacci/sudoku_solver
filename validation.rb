
def valid_puzzle?(array)
  total = 0
  array.each do |row|
    row.each do |element|
      unless element.is_a? Array
        total += element
      end
    end
  end

  if total == 405
    return  "Valid puzzle with a total of #{total}!"
  else
    return "Invalid puzzle! with a total of #{total}!"
  end
end

def no_arrays?(array)
    array.each do |row|
      row.each do |element|
        return false if element.is_a? Array
      end
    end
  return true
end

def box_finished?(box)
  if box == box.flatten
    return true
  else  
    return false
  end
end


  