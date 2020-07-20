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

Vehicle_inventory = []