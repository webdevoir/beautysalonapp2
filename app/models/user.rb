class User < ActiveRecord::Base
  has_secure_password
  
  validates :name, presence: true
  validates :password, length: { :minimum => 8 }
  validates :email, presence: true,
                    format: /\A\S+@\S+\z/,
                    uniqueness: { case_sensitive: false }
end
