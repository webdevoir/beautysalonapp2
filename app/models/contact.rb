class Contact
  include ActiveModel::Model

  attr_accessor :name, :string
  attr_accessor :email, :string
  attr_accessor :phone, :string
  attr_accessor :message, :string

  validates_presence_of :name, message: "naam is verplicht"
  validates_presence_of :email, message: "email is verplicht"
  validates_presence_of :phone, message: "telefoonnummer is verplicht"
  validates_presence_of :message, message: "geef een gewenste behandeling"
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i, message: "geef een geldig email adres"
  validates_length_of :message, :maximum => 500
end
