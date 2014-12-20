class Product < ActiveRecord::Base
  validates :title, :description, presence: true 
  validates :title, uniqueness: true

  scope :order_by_position, ->{ all.order(:position) }

  mount_uploader :image, ProductImageUploader
end
