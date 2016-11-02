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

puts "create product types"
["Áo khoác nam", "Áo thun, áo polo nam", "Áo sơ mi nam", "Quần shorts nam",
  "Quần jeans nam", "Quần kaki, quần tây nam", "Quần áo thể thao nam",
  "Áo vest, blazer", "Đồ lót, đồ ngủ", "Quần kiểu nam"].each do |product_type|
  ProductType.create! name: product_type
end

puts "create product colors"
["Red", "Green", "Yellow", "Blue", "White", "Black"].each do |product_color|
  ProductColor.create! name: product_color
end

puts "create products"
Product.create! name: "Áo Thun Dài Tay Cao Cấp - JHS2010", price: "285000",
  product_type: ProductType.all.sample, product_color: ProductColor.all.sample,
  description: Faker::Lorem.paragraph, location: "Hà Nội", product_images_attributes: {
    "0": {image: File.open(File.join(Rails.root, "app/assets/images/aothun1.jpg"))},
    "1": {image: File.open(File.join(Rails.root, "app/assets/images/aothun2.jpg"))}
  }

Product.create! name: "ÁO THUN NAM TAY DÀI - ATT-3670", price: "90000",
  product_type: ProductType.all.sample, product_color: ProductColor.all.sample,
  description: Faker::Lorem.paragraph, location: "Hà Nội", product_images_attributes: {
    "0": {image: File.open(File.join(Rails.root, "app/assets/images/aothun11.jpg"))},
    "1": {image: File.open(File.join(Rails.root, "app/assets/images/aothun12.jpg"))},
    "2": {image: File.open(File.join(Rails.root, "app/assets/images/aothun13.jpg"))},
  }

  Product.create! name: "Áo Thun Nam Dài Tay Sành điệu MS65 - MS65", price: "119000",
  product_type: ProductType.all.sample, product_color: ProductColor.all.sample,
  description: Faker::Lorem.paragraph, location: "Hà Nội", product_images_attributes: {
    "0": {image: File.open(File.join(Rails.root, "app/assets/images/aothun21.jpg"))},
    "1": {image: File.open(File.join(Rails.root, "app/assets/images/aothun22.jpg"))},
    "2": {image: File.open(File.join(Rails.root, "app/assets/images/aothun23.jpg"))},
  }

Product.create! name: "Áo Thun Nam Dài Tay Hàn Quốc Cổ Cách Điệu - PL315", price: "125000",
  product_type: ProductType.all.sample, product_color: ProductColor.all.sample,
  description: Faker::Lorem.paragraph, location: "Hà Nội", product_images_attributes: {
    "0": {image: File.open(File.join(Rails.root, "app/assets/images/aothun31.jpg"))},
    "1": {image: File.open(File.join(Rails.root, "app/assets/images/aothun32.jpg"))},
    "2": {image: File.open(File.join(Rails.root, "app/assets/images/aothun33.jpg"))}
  }

Product.create! name: "Áo thun dài tay lamborghini LB40 - LB42", price: "95000",
  product_type: ProductType.all.sample, product_color: ProductColor.all.sample,
  description: Faker::Lorem.paragraph, location: "Hà Nội", product_images_attributes: {
    "0": {image: File.open(File.join(Rails.root, "app/assets/images/aothun41.jpg"))},
    "1": {image: File.open(File.join(Rails.root, "app/assets/images/aothun42.jpg"))},
    "2": {image: File.open(File.join(Rails.root, "app/assets/images/aothun43.jpg"))}
  }
Product.create! name: "Áo thun dài tay Hej _ 0158 - MAT0158", price: "215000",
  product_type: ProductType.all.sample, product_color: ProductColor.all.sample,
  description: Faker::Lorem.paragraph, location: "Hà Nội", product_images_attributes: {
    "0": {image: File.open(File.join(Rails.root, "app/assets/images/aothun51.jpg"))},
    "1": {image: File.open(File.join(Rails.root, "app/assets/images/aothun52.jpg"))},
    "2": {image: File.open(File.join(Rails.root, "app/assets/images/aothun53.jpg"))},
    "3": {image: File.open(File.join(Rails.root, "app/assets/images/aothun54.jpg"))}
  }

Product.create! name: "Áo thun dài tay nữ đẹp ATSN - ATSN", price: "90000",
  product_type: ProductType.all.sample, product_color: ProductColor.all.sample,
  description: Faker::Lorem.paragraph, location: "Hà Nội", product_images_attributes: {
    "0": {image: File.open(File.join(Rails.root, "app/assets/images/aothun61.jpg"))}
  }

Product.create! name: "Áo thun dài tay Hej _ 0157 - MAT0157", price: "215000",
  product_type: ProductType.all.sample, product_color: ProductColor.all.sample,
  description: Faker::Lorem.paragraph, location: "Hà Nội", product_images_attributes: {
    "0": {image: File.open(File.join(Rails.root, "app/assets/images/aothun71.jpg"))},
    "1": {image: File.open(File.join(Rails.root, "app/assets/images/aothun72.jpg"))},
    "2": {image: File.open(File.join(Rails.root, "app/assets/images/aothun73.jpg"))},
    "3": {image: File.open(File.join(Rails.root, "app/assets/images/aothun74.jpg"))}
  }

Product.create! name: "áo thun dài tay cổ bẻ xanh biển - TD119", price: "176000",
  product_type: ProductType.all.sample, product_color: ProductColor.all.sample,
  description: Faker::Lorem.paragraph, location: "Hà Nội", product_images_attributes: {
    "0": {image: File.open(File.join(Rails.root, "app/assets/images/aothun81.png"))},
    "1": {image: File.open(File.join(Rails.root, "app/assets/images/aothun82.png"))},
    "2": {image: File.open(File.join(Rails.root, "app/assets/images/aothun83.png"))},
    "3": {image: File.open(File.join(Rails.root, "app/assets/images/aothun84.png"))}
  }

Product.create! name: "ÁO THUN DÀI TAY DÀNH CHO GIỚI THƯỢNG LƯU - DT054", price: "139000",
  product_type: ProductType.all.sample, product_color: ProductColor.all.sample,
  description: Faker::Lorem.paragraph, location: "Hà Nội", product_images_attributes: {
    "0": {image: File.open(File.join(Rails.root, "app/assets/images/aothun91.jpg"))},
    "1": {image: File.open(File.join(Rails.root, "app/assets/images/aothun92.jpg"))}
  }
