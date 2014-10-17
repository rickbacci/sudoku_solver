def blah(x)
  "#{x}"
end

def whatever
  " whatever"
end

def lambda_return
  string = ""
  string << lambda { return blah("nope") }.call
  string << lambda { return whatever }.call

  #p string
  #return "lambda_return method finished"

end

p lambda_return



class Array
  def iterate!(code)
    self.each_with_index do |n, i|
      self[i] = code.call(n)
    end
  end
end

def square(n)
  n ** 2
end

array = [1, 2, 3, 4]

array.iterate!(method(:square))

puts array.inspect