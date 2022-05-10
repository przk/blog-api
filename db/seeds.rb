# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

article = Page.new(title: "First article", body: "This is the first rails article")
article.save
comment = Comment.new(name: "user1", body: "comment 1", page: Page.find(1))
comment.save

