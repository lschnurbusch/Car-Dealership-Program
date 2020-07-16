class Vehicle
  
  attr_accessor :year_make_model, :mileage, :price, :color
  
  def initialize(year_make_model = "", mileage = 0, price = 0, color = "")
    @year_make_model = year_make_model
    @mileage = mileage
    @price = price
    @color = color
  end
  
  def collect_vehicle_info
    puts "\nLet's add a vehicle!\n"
    puts "What is the year, make, and model of the vehicle?"
    @year_make_model = gets.strip
    puts "How many miles does the vehicle have?"
    @mileage = gets.strip.to_f
    puts "What is the price of the vehicle?"
    @price = gets.strip.to_f
    puts "What is the color of the vehicle?"
    @color = gets.strip
  end
  
  def display_vehicle
    "\nThis vehicle is a #{@color} #{@year_make_model} with #{@mileage} miles, at a price of $#{@price}.\n"
  end
  
end

class Preference
  
  attr_accessor :max_mileage, :max_price, :fav_color, :mileage_imp, :price_imp, :color_imp
  
  def initialize(max_mileage = 0, max_price = 0, fav_color = "", mileage_imp = 0, price_imp = 0, color_imp = 0)
    @max_mileage = max_mileage
    @max_price = max_price
    @fav_color = fav_color
    @mileage_imp = mileage_imp
    @price_imp = price_imp
    @color_imp = color_imp
  end
  
  def collect_preference
    puts "\nTell me what kind of vehicle you'd like!\n"
    puts "What is the maximum amount of miles you would consider?"
    @max_mileage = gets.strip.to_f
    puts "What is the maximum price you would consider?"
    @max_price = gets.strip.to_f
    puts "What is your favorite color for a vehicle?"
    @fav_color = gets.strip
    puts "On a scale from 1 to 10, how important is low mileage to you?"
    @mileage_imp = gets.strip.to_i
    puts "On a scale from 1 to 10, how important is a low price to you?"
    @price_imp = gets.strip.to_i
    puts "On a scale from 1 to 10, how important is it that you find a vehicle of your favorite color?"
    @color_imp = gets.strip.to_i
  end
  
  def display_preference
    "\nI want a #{fav_color} vehicle with #{max_mileage} or fewer miles for $#{max_price} or less. On a scale from 1 to 10, low mileage has an importance of #{mileage_imp}, low price has an importance of #{price_imp}, and getting a vehicle of my favorite color has an importance of #{color_imp}.\n"
  end
  
  def score(vehicle) 
    mileage_points = (5 - (vehicle.mileage / (@max_mileage/5)))*@mileage_imp
    price_points = (5 - (vehicle.price / (@max_price/5)))*@price_imp
    puts "This vehicle #{puts self} has a preference score of #{100 + mileage_points + price_points}."
  end
end

vehicle1 = Vehicle.new()
vehicle1.collect_vehicle_info
puts vehicle1.display_vehicle

vehicle2 = Vehicle.new()
vehicle2.collect_vehicle_info
puts vehicle2.display_vehicle

vehicle_inventory = []
vehicle_inventory.push(vehicle1)
vehicle_inventory.push(vehicle2)

puts vehicle_inventory

preference1 = Preference.new()
preference1.collect_preference
puts preference1.display_preference

vehicle_inventory.each do |vehicle|
  preference1.score(vehicle)
end


