class Promotion < ActiveRecord::Base
  include Hideable

  validates :title, :description, presence: true

  mount_uploader :image, PromotionImageUploader
end
