class Section < ActiveRecord::Base
  validates :title, :description, presence: true
end
