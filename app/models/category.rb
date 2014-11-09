class Category < ActiveRecord::Base
  has_many :treatments
end
