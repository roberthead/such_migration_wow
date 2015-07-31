class RemoveDeckIdFromSlides < ActiveRecord::Migration
  def change
    remove_column :slides, :deck_id, :integer
  end
end
