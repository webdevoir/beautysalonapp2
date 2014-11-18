require 'rails_helper'

describe Section do
  it { should belong_to(:category) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should ensure_length_of(:description).is_at_most(150).with_message("De beschrijving mag maximum 150 karakters lang zijn") }
end
