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
      ### for UserTesting.com
      ### <rob@ministryofvelocity.com>
      ### [Ministry of Velocity](http://www.ministryofvelocity.com/ "Ministry of Velocity")
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
      Welcome.
    EOS
  },

  {
    header: "Rails Migrations. Pourquoi?",
    body: <<-EOS.gsub(/^ {6}/, ''),
      - `db/migrations` help us to manage the evolution of the schema
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "In the beginning...",
    body: <<-EOS.gsub(/^ {6}/, ''),
      <img src="/assets/green_grass_field.jpg" />
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "But if you're lucky, eventually... this.",
    body: <<-EOS.gsub(/^ {6}/, ''),
      ![Waiting...](/assets/cookie_waiting.gif "Cookie Monster waiting")
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "It Gets Worse!",
    body: <<-EOS.gsub(/^ {6}/, ''),
      While you are twiddling your fingers...

      ### The site is down!

      ![Fustrated guy at laptop](/assets/frustrated_guy.jpg "Fustrated guy at laptop")
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "Aaarrgggh! Why??",
    body: <<-EOS.gsub(/^ {6}/, ''),
      Oh. It was me. :|
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "Problem: Database vs. Code",
    body: <<-EOS.gsub(/^ {6}/, ''),
      - Because migrations are non-instantaneous...
        - If you migrate *during* deployment, the database is changing under the previous code
        - If you migrate *after* deployment, the new code begins running without the schema change
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "Principle",
    body: <<-EOS.gsub(/^ {6}/, ''),
      Any migration being deployed <strike>should</strike> <span class='strike-edit'>must</span> be compatible with the code that is already running.
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "Solution: Two-Stage Deployments",
    body: <<-EOS.gsub(/^ {6}/, ''),
      ### First Deployment

      - constructive schema migrations
      - data migrations
      - code:
        - writes to new schema
        - reads from new schema, falls back to old

      ### Second Deployment

      - destructive schema migrations
      - code:
        - reads from new only
        - removes data migration
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
      - Moving data from old schema to new schema
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "Data Migration Strategies",
    body: <<-EOS.gsub(/^ {6}/, ''),
      - separate from `db/migrations`
      - one-off `rake` task
      - deploy -> run -> verify -> delete from codebase
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },
  {
    header: "Some Best Practices",
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
      - Use reversible migration actions
        - Add creative attributes to destructive actions
        - <code>remove_column :posts, :slug<em class='optional'>, :string, index: true</em></code>
      - up-down-up
        - `rake db:migrate; rake db:rollback; rake db:migrate`
      - Did I lose data?
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
]

slide_attributes_list.each_with_index do |slide_attributes, index|
  deck.slides.where(slide_attributes).first_or_initialize do |slide|
    slide.position = index + 1
    slide.deck = deck
    slide.save
  end
end
