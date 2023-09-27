# frozen_string_literal: true

class Animal
  def animal
    @animal = type_of_animal
    @animal.looking_for
  end
  def type_of_animal
    raise "abstract method #type_of_animal must be defined"
  end
  end
