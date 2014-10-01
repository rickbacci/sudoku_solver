

trip = [[6, 8], [3, 4], [2, 6, 8], [3, 7], [2, 6], [3, 4, 7], [1, 5], 9, [1, 5]]


trip.each do |element|
  if element.size == 2 && trip.count(element) != 2
    # p "element size is 2 and not pair #{element}"
  end

  if element.size == 3

    x = element[0]
    y = element[1]
    z = element[2]

      combo1 = trip.include?([x, y].sort) && trip.include?([x, z].sort)
      combo2 = trip.include?([x, y].sort) && trip.include?([y, z].sort)
      combo3 = trip.include?([x, z].sort) && trip.include?([y, z].sort)

    #p element ## [3,4,7] should be [x,y] and [x,z] are true

    if combo1
      p element
      p [x,y]
      p [x,z]
      puts
    elsif combo2
      p element
      p [x,y]
      p [y,z]
      puts
    elsif combo3
      p element
      p [x,z]
      p [y,z]
      puts
    end
  end
end

