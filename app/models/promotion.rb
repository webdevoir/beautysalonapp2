class Promotion < ActiveRecord::Base
  validates :title, :description, presence: true

  mount_uploader :image, PromotionImageUploader
end
