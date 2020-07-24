class Vehicle
  
  attr_accessor :year, :make, :model, :condition, :miles, :price, :exterior_color, :interior_color, :mpg_city, :mpg_highway, :drive_type, :cylinders, :transmission, :doors, :features, :comments, :entry_date, :age
  
  def initialize(year = "", make = "", model = "", condition = "", miles = 0, price = 0, exterior_color = "", interior_color = "", mpg_city = 0, mpg_highway = 0, drive_type = "", cylinders = "", transmission = "", doors = "", features = "", comments = [], entry_date = Time.new.strftime("%D"))
    @year = year.to_i
    @make = make.capitalize
    @model = model.capitalize
    @condition = condition.downcase
    @miles = miles.to_f
    @price = price.to_f
    @exterior_color = exterior_color.downcase
    @interior_color = interior_color.downcase
    @mpg_city = mpg_city.to_f
    @mpg_highway = mpg_highway.to_f
    @drive_type = drive_type.upcase
    @cylinders = cylinders.to_i
    @transmission = transmission.downcase
    @doors = doors.to_i
    @features = features
    @comments = comments
    @entry_date = entry_date
    @age = Time.new.strftime("%Y").to_i - @year
    @kbb = "https://www.kbb.com/#{@make}/#{@model}/#{@year}/"
  end
  
  def collect_vehicle_info
    puts "\nLet's add a new vehicle!"
    puts "\n\tWhat is the vehicle's year?"
    @year = gets.strip.to_i
    puts "\n\tWhat is the vehicle's manufacturer?"
    @make = gets.strip.capitalize
    puts "\n\tWhat is the model of the vehicle?"
    @model = gets.strip.capitalize
    puts "\n\tIs the vehicle new or used?"
    @condition = gets.strip.downcase
    puts "\n\tHow many miles are currently on the vehicle?"
    @miles = gets.strip.to_f
    puts "\n\tWhat is the price of the vehicle?"
    @price = gets.strip.to_f
    puts "\n\tWhat is the exterior color of the vehicle?"
    @exterior_color = gets.strip.downcase
    puts "\n\tWhat is the interior color of the vehicle?"
    @interior_color = gets.strip.downcase
    puts "\n\tWhat is the vehicle's MPG in the city?"
    @mpg_city = gets.strip.to_f
    puts "\n\tWhat is the vehicle's MPG on the highway?"
    @mpg_highway = gets.strip.to_f
    puts "\n\tDoes the vehicle have four-wheel drive (enter '4WD'), front-wheel drive (enter 'FWD'), or rear-wheel drive (enter 'RWD')?"
    @drive_type = gets.strip.upcase
    puts "\n\tHow many engine cylinders? Enter a number."
    @cylinders = gets.strip.to_i
    puts "\n\tDoes the vehicle have an automatic or manual transmission?"
    @tranmission = gets.strip.downcase
    puts "\n\tHow many doors does the vehicle have? Enter a number."
    @doors = gets.strip.to_i
    puts "\n\tDoes the vehicle have any special features?"
    @features = gets.strip
    puts "\n\tAre there any other comments you would like to leave about this vehicle?"
    initial_comment = "Initial comments as of #{@entry_date}: " + gets.strip
    @comments.push(initial_comment)
    generate_kbb
    calculate_age
  end
  
  def display_vehicle_info
    puts "\n\tYear: #{@year}\n\tMake: #{@make}\n\tModel: #{@model}\n\tCondition: #{@condition}\n\tMiles: #{@miles}\n\tPrice: $#{@price}\n\tExterior Color: #{@exterior_color}\n\tInterior Color: #{@interior_color}\n\tMPG City: #{@mpg_city}\n\tMPG Highway: #{@mpg_highway}\n\tDrive Type: #{@drive_type}\n\tCylinders: #{@cylinders}\n\tTransmission: #{@transmission}\n\tDoors: #{@doors}\n\tFeatures: #{@features}\n\tComments: #{@comments}\n\tDate Entered: #{@entry_date}\n\tKelley Blue Book Link: #{@kbb}"
  end
  
  def add_comment
    puts "\nEnter new comment:"
    time_of_comment = Time.new.strftime("%D")
    comment = "#{time_of_comment}: " + gets.strip
    @comments.push(comment)
  end
  
  def calculate_age
    @age = Time.new.strftime("%Y").to_i - @year
  end
  
  def generate_kbb 
   @kbb = "https://www.kbb.com/#{@make}/#{@model}/#{@year}/"
  end
      
end

if __FILE__ == $0
  vehicle1 = Vehicle.new(1991, "Dodge", "Dakota", "Used", 148950, 4000, "White", "Gray", 15, 18, "4wd", 6, "Automatic", 2, "keyless entry, power windows", ["best truck ever"])
  vehicle1.display_vehicle_info
  
  vehicle1.add_comment
  vehicle1.display_vehicle_info

  puts "\nThe vehicle is #{vehicle1.age} years old."
  
  vehicle2 = Vehicle.new
  vehicle2.collect_vehicle_info
  vehicle2.display_vehicle_info
  vehicle2.add_comment
  vehicle2.display_vehicle_info
  puts vehicle2.generate_kbb
  
  puts "\nThe vehicle is #{vehicle2.age} years old."
end
