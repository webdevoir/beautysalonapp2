class Product < ActiveRecord::Base
  validates :title, :description, presence: true 
  validates :title, uniqueness: true

  mount_uploader :image, ProductImageUploader
end
