class ParentClass
  def method1
    puts "Hello from method1 in the parent class"
  end

  def method2
    puts "Hello from method2 in the parent class"
  end
end

class ChildClass < ParentClass
  def method2
    puts "Hello from method2 in the child class"
  end
end

my_object = ChildClass.new
my_object.method1
my_object.method2

class Person
  attr_accessor :name
end

class Doctor <  Person
  def name
    "Dr. " + super
  end
end

dr_jones = Doctor.new
dr_jones.name="Fred Jones"
p dr_jones.name