class Slide < ActiveRecord::Base
  belongs_to :deck

  before_validation :compute_slug

  def to_param
    slug.presence || compute_slug
  end

  private

  def compute_slug
    self.slug = "#{position}-#{header.parameterize}"
  end
end
