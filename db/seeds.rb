# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

stones = Stone.create([{name: "Diamond", cost: 620, weight: 0.3}, {name: "Pink Diamond", cost: 2500, weight: 1.2}, {name: "Opal", cost: 860, weight: 0.4},
  {name: "Ruby", cost: 325, weight: .25}, {name: "Tourmaline", cost: 600, weight: 0.5}, {name: "Sapphire", cost: 1500, weight: 0.95}])

users = User.create([{email: "johnny@jewelry.com", password: "diamonds4ever", name: "John", location: "Timbuktu"}, {email: "carter@jeweler.com", password: "panther123", name: "Carter", location: "Greenwich, CT"},
  {email: "betty@jeweler.com", password: "cufflinks456"}])

designs = Design.create([{user_id: 1, stone_id: 6, metal: "Pink Gold", model: "Ring"}, {user_id: 2, stone_id: 4, metal: "Platinum", model: "Bracelet"},
  {user_id: 2, stone_id: 2, metal: "Yellow Gold", model: "Ring"}, {user_id: 3, stone_id: 3, metal: "Sterling Silver", model: "Necklace"}])
