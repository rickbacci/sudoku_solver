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