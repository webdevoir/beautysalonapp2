class Treatment < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :filter_by_category, ->(category){ filter(category).order(:position) }
  scope :order_by_position, ->{ order(:position) }
  scope :sort_by_category, ->(category_id){ all.where(category_id: category_id).order(:position) }

  belongs_to :category
  validates :title, :summary, :description, presence: true
  validates :summary, length: { maximum: 150, :too_long => "Samenvatting is te lang (maximum 150 karakters)" }
  validates :price, numericality: true, allow_blank: true

  mount_uploader :image, TreatmentImageUploader

  private

  def self.filter(filter)
    if filter
      where(category_id: filter)
    end
  end
  
end
