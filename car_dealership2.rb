class Vehicle
  
  attr_accessor :year_make_model, :mileage, :price, :color
  
  def initialize(year_make_model = "", mileage = 0, price = 0, color = "")
    @year_make_model = year_make_model
    @mileage = mileage
    @price = price
    @color = color
  end
  
  def collect_vehicle_info
    puts "What is the year, make, and model of the vehicle?"
    self.year_make_model = gets.strip
    puts "How many miles does the vehicle have?"
    self.mileage = gets.strip.to_f
    puts "What is the price of the vehicle?"
    self.price = gets.strip.to_f
    puts "What is the color of the vehicle?"
    self.color = gets.strip
  end
  
  def display_vehicle
    "This vehicle is a #{@color} #{@year_make_model} with #{@mileage} miles, at a price of $#{@price}."
  end
  
  def score
    puts "What is the maximum amount of miles you would consider?"
    max_mileage = gets.strip.to_f
    puts "What is the maximum price you would consider?"
    max_price = gets.strip.to_f
    puts "What is your favorite color for a vehicle?"
    fav_color = gets.strip
    puts "On a scale from 1 to 10, how important is low mileage to you?"
    mileage_imp = gets.strip.to_f
    puts "On a scale from 1 to 10, how important is a low price to you?"
    price_imp = gets.strip.to_f
    puts "On a scale from 1 to 10, how important is it that you find a vehicle of your favorite color?"
    color_imp = gets.strip.to_f
    mileage_points = (5 - (@mileage / (max_mileage/5)))*mileage_imp
    price_points = (5 - (@price / (max_price/5)))*price_imp
    puts "This vehicle #{puts self} has a preference score of #{100 + mileage_points + price_points}."
  end
    
end

puts "Let's add a new vehicle."
vehicle1 = Vehicle.new()
vehicle1.collect_vehicle_info

puts "Let's add a new vehicle."
vehicle2 = Vehicle.new()
vehicle2.collect_vehicle_info

vehicle_inventory = []
vehicle_inventory.push(vehicle1)
vehicle_inventory.push(vehicle2)

vehicle_inventory.each do |vehicle|
  puts vehicle.score
end
  
