class Treatment < ActiveRecord::Base
  belongs_to :category
  validates :title, :summary, :description, presence: true
  validates :price, numericality: true, allow_blank: true

  mount_uploader :image, TreatmentImageUploader

  private

  def self.filter(filter)
    if filter
      where(category_id: filter)
    end
  end
  
end
