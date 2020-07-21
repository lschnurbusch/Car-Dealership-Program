require_relative 'vehicle_class'

class Preference
  
  attr_reader :max_mileage, :max_price, :fav_color, :mileage_imp, :price_imp, :color_imp
  
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
    if vehicle.color == @fav_color
      color_points = 5 * @color_imp
    else 
      color_points = 0
    end
    100 + mileage_points + price_points + color_points
  end
  
  def calculate_preference_scores
    Vehicle_inventory.each do |vehicle|
      if vehicle.mileage <= @max_mileage && vehicle.price <= @max_price
      preference_score = score(vehicle)
      puts "#{vehicle.year_make_model}'s preference score is #{preference_score}."
    end
    end
  end    
end