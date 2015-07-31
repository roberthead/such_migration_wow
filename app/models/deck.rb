class Deck < ActiveRecord::Base
  has_many :slides, -> { order(:position) }, dependent: :destroy

  before_validation :compute_slug

  def to_param
    slug
  end

  private

  def compute_slug
    self.slug = name.parameterize
  end
end
