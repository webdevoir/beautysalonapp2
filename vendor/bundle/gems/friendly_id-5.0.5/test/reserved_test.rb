require "helper"

class ReservedTest < Minitest::Test

  include FriendlyId::Test

  class Journalist < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, :use => [:slugged, :reserved], :reserved_words => %w(new edit)

    after_validation :move_friendly_id_error_to_name

    def move_friendly_id_error_to_name
      errors.add :name, *errors.delete(:friendly_id) if errors[:friendly_id].present?
    end
  end

  def model_class
    Journalist
  end

  test "should reserve words" do
    %w(new edit NEW Edit).each do |word|
      transaction do
        assert_raises(ActiveRecord::RecordInvalid) {model_class.create! :name => word}
      end
    end
  end

  test "should move friendly_id error to name" do
    with_instance_of(model_class) do |record|
      record.errors.add :name, "xxx"
      record.errors.add :friendly_id, "yyy"
      record.move_friendly_id_error_to_name
      assert record.errors[:name].present? && record.errors[:friendly_id].blank?
      assert_equal 2, record.errors.count
    end
  end

end