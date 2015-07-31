class Deck < ActiveRecord::Base
  has_many :slides

  before_validation :compute_slug

  def to_param
    slug
  end

  private

  def compute_slug
    self.slug = name.parameterize
  end
end
