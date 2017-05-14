# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

99.times do |n|
  Post.create(title: "I got #{n+1} problems",
              short_desc: "But a bitch ain't one",
              content: 'Hello Worlds',
              published: true
             )
end
