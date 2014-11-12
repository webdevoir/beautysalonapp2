class Section < ActiveRecord::Base
  validates :title, :description, presence: true

  mount_uploader :image, SectionImageUploader
end
