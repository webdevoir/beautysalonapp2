class Section < ActiveRecord::Base
  belongs_to :category
  validates :title, :description, presence: true

  mount_uploader :image, SectionImageUploader
end
