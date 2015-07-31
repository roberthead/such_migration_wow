class Deck < ActiveRecord::Base
  # TODO After next deployment, add me and remove slides() method
  # has_many :slides, through: :slide_placements, -> { order 'slide_placements.position' }

  before_validation :compute_slug

  def to_param
    slug
  end

  def slides
    if SlidePlacement.count(deck_id: id)
      placement_ids = SlidePlacement.where(deck_id: id).pluck(:id)
      Slide.where(id: placement_ids)
    else
      Slide.where(deck_id: id).order(:position)
    end
  end

  private

  def compute_slug
    self.slug = name.parameterize
  end
end
