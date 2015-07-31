# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

deck = Deck.where(slug: "zero-downtime-migrations").first_or_create do |deck|
  deck.name = "Strategies for Zero Downtime Migrations"
  deck.description = "Roll out database schema changes and data migrations to a Ruby on Rails application without production downtime."
  deck.author_name = "Robert Head"
end

deck.slides.destroy_all

slide_attributes_list = [
  {
    header: "Strategies for Zero Downtime Migrations",
    body: <<-EOS.gsub(/^ {6}/, ''),
      ### Robert Head

      ### UserTesting.com
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
      Welcome.
    EOS
  },

  {
    header: "Principles for Deployments",
    body: <<-EOS.gsub(/^ {6}/, ''),
      ### Migrations must be:

      - Reversible
      - Restrained

      ### Code must be:

      - Flexible
      EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
      ## Reversible?

      - Strive to use the reversible migration actions.
      - Add additional creative attributes to destructive actions in the change method

      ## Restrained?

      - Constrained to migration actions
      - Schema changes only
      - No data migrations
      - No references to external classes
      - SQL when necessary
    EOS
  },
]

slide_attributes_list.each_with_index do |slide_attributes, index|
  deck.slides.where(slide_attributes).first_or_initialize do |slide|
    slide.position = index + 1
    slide.deck = deck
    slide.save
  end
end
