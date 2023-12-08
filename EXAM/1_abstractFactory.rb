# Абстрактний клас фабрики транспортних засобів
class VehicleFactory
  def create_vehicle
    raise NotImplementedError, "#{self.class} must implement create_vehicle method"
  end
end

# Конкретна фабрика для створення автомобілів
class CarFactory < VehicleFactory
  def create_vehicle
    Car.new
  end
end

# Конкретна фабрика для створення мотоциклів
class MotorcycleFactory < VehicleFactory
  def create_vehicle
    Motorcycle.new
  end
end

# Абстрактний клас транспортного засобу
class Vehicle
  def drive
    raise NotImplementedError, "#{self.class} must implement drive method"
  end
end

# Конкретна реалізація автомобіля
class Car < Vehicle
  def drive
    puts "Driving a car"
  end
end

# Конкретна реалізація мотоцикла
class Motorcycle < Vehicle
  def drive
    puts "Riding a motorcycle"
  end
end

# Клієнтський код
def use_vehicle(factory)
  vehicle = factory.create_vehicle
  vehicle.drive
end

# Використання фабрики автомобілів
car_factory = CarFactory.new
use_vehicle(car_factory)

# Використання фабрики мотоциклів
motorcycle_factory = MotorcycleFactory.new
use_vehicle(motorcycle_factory)