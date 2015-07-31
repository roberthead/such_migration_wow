# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Slide.destroy_all
Deck.destroy_all

deck = Deck.where(slug: "zero-downtime-migrations").first_or_create do |deck|
  deck.name = "Zero Downtime Migrations"
  deck.description = "Roll out database schema changes and data migrations to a Ruby on Rails application without production downtime."
  deck.author_name = "Robert Head"
end

slide_attributes_list = [
  {
    header: "Zero Downtime Migrations",
    body: <<-EOS.gsub(/^ {6}/, ''),
      ### for UserTesting.com
      ### <rob@ministryofvelocity.com>
      ### [Ministry of Velocity](http://www.ministryofvelocity.com/ "Ministry of Velocity")
      ### 31 July 2015
      ![Robert Head](/assets/robert_head.jpg)
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
      Welcome.
    EOS
  },

  {
    header: "Pourquoi?",
    body: <<-EOS.gsub(/^ {6}/, ''),
      ### Rails Migrations Origin Story
      - `db/migrations` help us to manage the evolution of the database schema
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "In the beginning...",
    body: <<-EOS.gsub(/^ {6}/, ''),
      ![Green field](/assets/green_grass_field.jpg "Green field")
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "But if you're lucky, eventually... this.",
    body: <<-EOS.gsub(/^ {6}/, ''),
      ![Cookie Monster waiting...](/assets/cookie_waiting.gif "Cookie Monster waiting")
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
      - Migrations are non-instantaneous
      - Therefore...
        - If you migrate *during* deployment, the database is *changing under* the previous code
        - If you migrate *after* deployment, the new code begins running *without the schema change*
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
    header: "Principle",
    body: <<-EOS.gsub(/^ {6}/, ''),
      Any code being deployed <strike>should</strike> <span class='strike-edit'>must</span> be compatible with the database before and after any coupled data migrations.
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "Solution: Two-Stage Deployments",
    body: <<-EOS.gsub(/^ {6}/, ''),
      1. Constructive Deployment
        - Human intervention and sanity checking
      2. Destructive Deployment
        - Confident clean-up
      ![2](/assets/2-badger.gif "2")
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "1. Constructive Deployment",
    body: <<-EOS.gsub(/^ {6}/, ''),
      - What's in it?
        - constructive schema migrations
        - data migrations
        - code writes to new schema
        - code reads from new, falls back to old
      - Post-deployment:
        - Manually run data migrations
        - Verify data integrity in new schema
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "2. Destructive Deployment",
    body: <<-EOS.gsub(/^ {6}/, ''),
      - separate branch + pull request
        - held until after first deployment
        - What's in it?
      - destructive schema migrations
      - cleaned-up code that reads from new schema only
      - may remove data migration task
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
      - Any failures?
      - Any data loss?
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
      - Tested?
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "Deliberate Data Migrations",
    body: <<-EOS.gsub(/^ {6}/, ''),
      - Deferrable
      - Run manually by humans
      - Verified manually by humans
      - Temporary
        - Delete from code after verification
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

  {
    header: "Schema Migration Still Locking Users Out?",
    body: <<-EOS.gsub(/^ {6}/, ''),
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "The Nuclear Option",
    body: <<-EOS.gsub(/^ {6}/, ''),
      ### Large Hadron Migrator

      Use case:

      - When the migration triggers a long-lived lock of the table
      - For example, creating an index on a huge table
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "Let's Code!",
    body: <<-EOS.gsub(/^ {6}/, ''),
      ### User Story

      IN ORDER TO save time

      AS a content creator

      I WANT to be able to re-use slides in other decks
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "The Plan",
    body: <<-EOS.gsub(/^ {6}/, ''),
      1. First Deployment (Constructive)
      2. Run data migrations on server
        - `rake migrate_data:use_slide_sharing`
      3. Verify data
      4. Second Deployment (Destructive)
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "The Medium is the Message",
    body: <<-EOS.gsub(/^ {6}/, ''),
      <https://github.com/roberthead/such_migration_wow>

      Explore the Pull Requests
    EOS
    speaker_notes: <<-EOS.gsub(/^ {6}/, ''),
    EOS
  },

  {
    header: "Some Resources",
    body: <<-EOS.gsub(/^ {6}/, ''),
      - <http://blog.codeship.com/rails-migrations-zero-downtime/>
      - <http://blog.carbonfive.com/2011/01/27/start-testing-your-migrations-right-now/>
      - <http://vesavanska.com/2014/activerecord-migrations-best-practices/>
      - <http://jordanhollinger.com/2014/07/30/rails-migration-etiquette/>
      - <http://selectedproblems.blogspot.com/2011/09/rails-migrations-best-practices.html>
      - <http://rails-bestpractices.com/tag/migration/>
      - <https://developers.soundcloud.com/blog/soundcloud-mobile-%E2%80%93-proxies.html>
      - <http://tech.taskrabbit.com/blog/2014/10/30/rails-schema-with-lhm/>
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
