puts "Create admins"
User.create! email: "admin@gmail.com", 
  name: "admin", password: "123456", password_confirmation: "123456", role: 1

puts "Create cities"
Settings.cities.each do |city_id, city_name|
  City.create! name: city_name
end

puts "Create towns"
town_file_data = File.open "db/town.txt", "r"
town_file_data.each_line do |town|
  a = town.strip.split ":"
  Town.create! name: a.last, city_id: a.first.to_i
end
