class Deck < ActiveRecord::Base
  before_validation :compute_slug

  # Transitional flexible fetch for two-stage deployment of schema change
  def slides
    if SlidePlacement.where(deck_id: id).any?
      placement_ids = SlidePlacement.where(deck_id: id).pluck(:id)
      Slide.where(id: placement_ids)
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
