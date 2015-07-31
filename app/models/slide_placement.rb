class SlidePlacement < ActiveRecord::Base
  belongs_to :deck
  belongs_to :slide

  default_scope { order :position }
end
