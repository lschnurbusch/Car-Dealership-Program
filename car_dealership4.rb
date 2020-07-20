vehicle1 = Vehicle.new()
vehicle1.collect_vehicle_info
Vehicle_inventory.push(vehicle1)

vehicle2 = Vehicle.new()
vehicle2.collect_vehicle_info
Vehicle_inventory.push(vehicle2)

vehicle3 = Vehicle.new("2019 Jeep Cherokee", 80000, 7500, "green")
Vehicle_inventory.push(vehicle3)

puts Vehicle_inventory

preference1 = Preference.new()
preference1.collect_preference
puts preference1.display_preference

preference1.calculate_preference_scores