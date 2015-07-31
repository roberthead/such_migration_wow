namespace :data do
  desc "TODO"
  task migrate_to_slide_placements: :environment do
    Slide.find_each do |slide|
      SlidePlacement.where(deck_id: slide.deck_id, slide_id: slide.id).first_or_create do |placement|
        placement.position = slide.position
      end
    end
  end
end
