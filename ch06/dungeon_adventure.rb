class Dungeon
  attr_accessor :player
  
  def initialize(player)
    @player = player
    @rooms = {}
  end
  
  def add_room(reference, name, description, connections)
    @rooms[reference] = Room.new(reference, name, description, connections)
  end
  
  def start(location)
    @player.location = location
    show_current_description
  end
  
  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end
  
  def find_room_in_dungeon(reference)
    @rooms[reference]
  end
  
  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end
  
  def go(direction)
    if find_room_in_direction(direction)
      puts "You go #{direction.to_s}."
      @player.location = find_room_in_direction(direction)
    else
      puts "You can't go that way."
    end
    show_current_description
  end
end

class Player
  attr_accessor :name, :location
  
  def initialize(name)
    @name = name
  end
end

class Room
  attr_accessor :reference, :name, :description, :connections
  
  def initialize(reference, name, description, connections)
    @reference = reference
    @name = name
    @description = description
    @connections = connections
  end
  
  def full_description
    "#{@name}\n\nYou are in #{@description}"
  end
end

print "What is your name? >"
name = gets.chomp

player = Player.new(name)
my_dungeon = Dungeon.new(player)

my_dungeon.add_room(:clearing,
                    "Sunny Clearing",
                    "a sunny clearing. There is a red door to the north.",
                    {:north => :smallroom })

my_dungeon.add_room(:smallroom,
                    "Small Room",
                    "a small room with a red door to the south and a trap " +
                    "door leading down.",
                    { :down => :smallcave, :south => :clearing })

my_dungeon.add_room(:smallcave,
                    "Small Cave",
                    "a small, claustrophobic cave with a ladder leading up\n" +
                    "and a worn passage leading east.",
                    { :east => :largecave, :up => :smallroom })

my_dungeon.add_room(:largecave,
                    "Large Cave",
                    "a large cavernous cave with a worn passage leading west.",
                    { :west => :smallcave })

my_dungeon.start(:smallroom)

quit = false
until quit do
  print "What direction would you like to go, #{player.name}?\n(type <quit>" +
  " to quit) >"
  direction = gets.downcase.chomp
  if direction == "quit"
    quit = true
  else
    my_dungeon.go(direction.to_sym)
  end
end

puts "You have been eaten by a gru!"

