class Treat < ActiveRecord::Base
  validates :title, :summary, :description, presence: true
  validates :price, numericality: true, allow_blank: true
end
