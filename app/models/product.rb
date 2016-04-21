class Product < ActiveRecord::Base
  validates :title, :description, presence: true 
  validates_uniqueness_of :title

  scope :order_by_position, ->{ all.order(:position) }

  mount_uploader :image, ProductImageUploader
end
