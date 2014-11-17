class Section < ActiveRecord::Base
  belongs_to :category
  validates :title, :description, presence: true
  validates :description, length: { maximum: 150, :too_long => "De beschrijving mag maximum 150 karakters lang zijn" }

  mount_uploader :image, SectionImageUploader
end
