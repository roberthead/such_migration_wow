class Deck < ActiveRecord::Base
  before_validation :compute_slug
  has_many :slide_placements, -> { order :position }

  # Transitional flexible fetch for two-stage deployment of schema change
  # TODO switch to has_many :slides, through: :slide_placements
  def slides
    @slides ||=
      if slide_placements.any?
        Slide.where(id: slide_placements.pluck(:slide_id))
      else
        Slide.where(deck_id: id)
      end
  end

  def to_param
    slug
  end

  private

  def compute_slug
    self.slug = name.parameterize
  end
end
