class Promotion < ActiveRecord::Base
  include Hideable

  validates :title, :summary, :description, presence: true
  validates :summary, length: { maximum: 150, :too_long => "Samenvatting is te lang (maximum 150 karakters)" }
  validates :price, numericality: true, allow_blank: true

  mount_uploader :image, PromotionImageUploader
end
