# Визначення модулю
module Greetable
  def greet
    puts "Hello!"
  end
end

# Визначення класу, який включає модуль
class Person
  include Greetable
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# Визначення ще одного класу, який також включає модуль
class Animal
  include Greetable
  attr_accessor :species

  def initialize(species)
    @species = species
  end
end

# Створення екземплярів класів та виклик методу з модулю
person = Person.new("John")
person.greet
puts "Person's name: #{person.name}"

animal = Animal.new("Dog")
animal.greet
puts "Animal's species: #{animal.species}"
