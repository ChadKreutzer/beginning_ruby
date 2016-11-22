x = "This is a test"
puts x.class
puts x.length
puts x.upcase

class String
  def length
    20
  end
end

p x.length
p "a".length
p "A really long line of text".length

class Dog
  def talk
    puts "Woof!"
  end
end

my_dog = Dog.new
my_dog.talk

class Dog
  def talk
    puts "Howl!"
  end
end

my_dog.talk