# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Deck.where(slug: "zero-downtime-migrations").first_or_create do |deck|
  deck.update({
    name: "Zero Downtime Migrations",
    description: "Roll out database schema changes and data migrations to a Ruby on Rails application without production downtime.",
    author_name: "Robert Head"
  })
end
