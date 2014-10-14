Matrix = Struct.new(:row, :column) do

  def element
    "row: #{row}, column: #{column}"
  end

end

p Matrix.new(0, 0)
p x = Matrix.new(0, 1)

p x[:column]



