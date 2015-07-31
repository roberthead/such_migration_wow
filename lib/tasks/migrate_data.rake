namespace :migrate_data do
  desc "TODO"
  task use_slide_sharing: :environment do
    Slide.find_each do |slide|
      SlidePlacement.where(deck_id: slide.deck_id, slide_id: slide.id).first_or_create do |placement|
        placement.position = slide.position
      end
    end
  end
end
