class Shape
end

class Square < Shape
  def initialize(side_length)
    @@number_of_squares = defined?(@@number_of_squares) ? @@number_of_squares += 1 : 1
    @side_length = side_length
  end

  def self.count
    @@number_of_squares
  end

  def self.test_method
    puts "Hello from the Square class!"
  end

  def test_method
    puts "hello from an instance of class Square"
  end

  def area
    @side_length**2
  end

  def perimeter
    @side_length * 4
  end
end

class Triangle < Shape
  def initialize(base_width, height, side1, side2, side3)
    @base_width = base_width
    @height = height
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def area
    @base_width * @height / 2
  end

  def perimeter
    @side1 + @side2 + @side3
  end  
end



my_square = Square.new(5)
my_triangle = Triangle.new(6,6,7.81,7.81,7.81)
puts my_square.area
puts my_square.perimeter
puts my_triangle.area
puts my_triangle.perimeter
a = Square.new(10)
b = Square.new(5)
puts a.area
puts b.area
puts Square.count

Square.test_method
Square.new(6).test_method