

def total(total)
  if total == 405
    return  "Valid puzzle with a total of #{total}!"
  else
    return "Invalid puzzle! with a total of #{total}!"
  end
end


def valid_puzzle?(array)
  total = 0
  array.each do |row|
    row.each do |element|
      total += element unless element.is_a?(Array)
    end
  end
  total(total)
end

def no_arrays?(array)
  array.each do |row|
    row.each do |element|
      return false if element.is_a? Array
    end
  end
  true
end

def box_finished?(box)
  if box == box.flatten
    return true
  else
    return false
  end
end


  