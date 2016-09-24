puts "Create admin"
User.create! email: "admin@gmail.com", 
  name: "admin", password: "111111", password_confirmation: "111111", role: 1
