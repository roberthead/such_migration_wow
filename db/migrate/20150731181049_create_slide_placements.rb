class CreateSlidePlacements < ActiveRecord::Migration
  def change
    create_table :slide_placements do |t|
      t.belongs_to :deck, index: true, foreign_key: true
      t.belongs_to :slide, index: true, foreign_key: true
      t.integer :position

      t.timestamps null: false
    end
  end
end
