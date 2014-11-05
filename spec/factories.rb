FactoryGirl.define do
  factory :promotion do
    title { Faker::Lorem.words(5).join(" ") }
    tagline { Faker::Lorem.words(5).join(" ") }
    description { Faker::Lorem.paragraph(1) }
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/promotions/environ-peeling-kuur.jpg')))
    price 40.16
  end
end
