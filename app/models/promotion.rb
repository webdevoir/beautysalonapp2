class Promotion < ActiveRecord::Base
  include Hideable

  validates :title, :description, presence: true
  validates :price, numericality: true, allow_blank: true

  mount_uploader :image, PromotionImageUploader
end
