FactoryBot.define do
  factory :item do
    name        { Faker::Name.initials(number: 4) }
    description { "テストコード用の説明" }
    delivery_id { 2 }
    day_id      { 2 }
    price       { 1000 }
    tag_id      { 2 }
    area_id     { 2 }
    status_id   { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
