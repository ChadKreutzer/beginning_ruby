
#namespace

module NumberStuff
  def self.random
    rand(1000000)
  end
end

module LetterStuff
  def self.random
    (rand(26) + 65).chr
  end
end

puts NumberStuff.random
puts LetterStuff.random

module ToolBox
  class Ruler
    attr_accessor :length
  end
end

module Country
  class Ruler
    attr_accessor :name
  end
end

a = ToolBox::Ruler.new
a.length = 50
b = Country::Ruler.new
b.name = "Genghis Khan from Moskau"

# mix-ins

module UsefulFeatures
  def class_name
    self.class.to_s
  end
end

class Person
  include UsefulFeatures
end

x = Person.new
puts x.class_name

module AnotherModule
  def do_stuff
    puts "This is a test"
  end
end

include AnotherModule
do_stuff

my_array = %w{this is a test of the longest word check}
longest_word = ''
my_array.each do |word|
  longest_word = word if longest_word.length < word.length
end
puts longest_word

my_array = %w{10 56 92 3 49 588 10}
highest_number = 0
my_array.each do |number|
  number = number.to_i
  highest_number = number if number > highest_number
end
puts highest_number

class AllVowels
  include Enumerable

  VOWELS = %w{a e i o u}

  def each
    VOWELS.each{ |v| yield v }
  end
end

x = AllVowels.new
x.each{ |v| print v }
puts

x = AllVowels.new

p x.collect{|i| i + "x"}
p x.detect{|i| i > "j"}
p x.select{|i| i > "j"}
p x.sort
p x.max
p x.min

class Song
  include Comparable

  attr_accessor :length

  def <=>(other)
    @length <=> other.length
  end

  def initialize(song_name, length)
    @song_name = song_name
    @length = length
  end

end

a = Song.new('Rock around the Clock', 143)
b = Song.new('Bohemian Rhapsody', 544)
c = Song.new('Minute Waltz', 60)

p a < b
p b >= c
p c > a
p a.between?(c,b)

module ToolBox
  class Ruler
    attr_accessor :length
  end
end

module Country
  class Ruler
    attr_accessor :name
  end
end

a = ToolBox::Ruler.new
a.length = 50
b = Country::Ruler.new
b.name = "Genghis Khan of Moskau"

include Country
c = Ruler.new
c.name = "King Henry VIII"

p a.length
p b.name
p c.name