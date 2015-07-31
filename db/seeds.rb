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
    header: "Zero Downtime Migrations",
    body: <<-EOS.gsub(/^ {6}/, ''),
      ### Robert Head

      ### UserTesting.com
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
      Welcome.
    EOS
  },
  {
    header: "Pourquoi",
    body: <<-EOS.gsub(/^ {6}/, ''),
      - `db/migrations` are for evolving the schema
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },
  {
    header: "Schema vs. Data Migrations",
    body: <<-EOS.gsub(/^ {6}/, ''),
      - Schema Migration changes structure
      - Data Migration changes content
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },
  {
    header: "Constructive vs. Destructive Migrations",
    body: <<-EOS.gsub(/^ {6}/, ''),
      - Constructive migrations add tables, columns, or indexes
      - Destructive migrations remove or modify tables or columns
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },
  {
    header: "Constructive Migrations",
    body: <<-EOS.gsub(/^ {6}/, ''),
      - `create_*`
      - `add_*`
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },
  {
    header: "Destructive Migrations",
    body: <<-EOS.gsub(/^ {6}/, ''),
      - `drop_*`
      - `remove_*`
      - `change_*`
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },
  {
    header: "Data Migrations",
    body: <<-EOS.gsub(/^ {6}/, ''),
      - Extract, Transform and Load (ETL)
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },
  {
    header: "Data Migration Strategies",
    body: <<-EOS.gsub(/^ {6}/, ''),
      - separate from `db/schema`
      - one-off rake task
      - deploy -> run -> verify -> delete from codebase
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },
  {
    header: "Happy Deployments",
    body: <<-EOS.gsub(/^ {6}/, ''),
      ### Schema Migrations

      - Reversible
      - Responsible

      ### Data Migrations

      - Deliberate

      ### Code

      - Flexible
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },
  {
    header: "Reversible Schema Migrations",
    body: <<-EOS.gsub(/^ {6}/, ''),
      - up-down-up
        - `rake db:migrate; rake db:rollback; rake db:migrate`
      - Did I lose data?
      - Use reversible migration actions
        - Add creative attributes to destructive actions
        - <code>remove_column :posts, :slug<em class='optional'>, :string, index: true</em></code>
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
      - or `rake db:migrate; rake db:migrate:redo`
    EOS
  },
  {
    header: "Responsible Schema Migrations",
    body: <<-EOS.gsub(/^ {6}/, ''),
      - SchemaStatements only
        - no data transformations
      - Single table
      - Safe
        - Compatible with the code currently deployed
        - ZDM!
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },
  {
    header: "Principle",
    body: <<-EOS.gsub(/^ {6}/, ''),
      Any migration being deployed should be compatible with the code that is already running.
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },
  {
    header: "Deliberate Data Migrations",
    body: <<-EOS.gsub(/^ {6}/, ''),
      - Deferrable
      - Run manually
      - Verified manually
      - Temporary
        - Delete from code after verification
        - Time-bomb?
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },
  {
    header: "Flexible Code",
    body: <<-EOS.gsub(/^ {6}/, ''),
      - Works before and after coupled *schema migrations*
      - Works before and after coupled *data migrations*
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },
  {
    header: "Happy Deployments (revisited)",
    body: <<-EOS.gsub(/^ {6}/, ''),
      ### Schema Migrations

      - Reversible
      - Responsible

      ### Data Migrations

      - Deliberate

      ### Code

      - Flexible
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  # explain the problem

  {
    header: "Double Deployment Strategy",
    body: <<-EOS.gsub(/^ {6}/, ''),
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
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
