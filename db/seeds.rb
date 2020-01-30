# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.create( name: "tippy", admin: true, password: "initialpassword")
Font.create( user_id: 1, swapfont: 0)
User.create( name: "user1", admin: false, password: "initialpassword")
Font.create( user_id: 2, swapfont: 0)
