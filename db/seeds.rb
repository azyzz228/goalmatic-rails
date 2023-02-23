# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
categories = Category.create([{name: "Sleep"}, {name: "Study"}])
puts(categories)

challenges = Challenge.create([
    {name: "Sleep 40 hours a week", category_id: categories[0].id, goal: 40, progress: 0, units: "hours", ends_at: "2023-12-31"},
    {name: "Study 18 hours a week", category_id: categories[1].id, goal: 18, progress: 0, units: "hours", ends_at: "2023-12-31"}
])

activities = Activity.create([
    {note:"Went to bed on time", amount: 8, challenge_id: challenges[0].id},
    {note:"Got it done right after lunch", amount: 3,  challenge_id: challenges[1].id}
])

puts(challenges)