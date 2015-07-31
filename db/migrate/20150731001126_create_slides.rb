class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.belongs_to :deck, index: true
      t.integer :position
      t.string :header
      t.string :slug
      t.text :body
      t.text :speaker_notes

      t.timestamps null: false
    end
  end
end
