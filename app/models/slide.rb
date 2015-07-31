class Slide < ActiveRecord::Base
  has_many :slide_placements
  has_many :decks, through: :slide_placements

  before_validation :compute_slug

  def to_param
    slug.presence || compute_slug
  end

  private

  def compute_slug
    self.slug = "#{position}-#{header.parameterize}"
  end
end
