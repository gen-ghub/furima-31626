FactoryBot.define do
  factory :shopping do
    postal_code { '123-4567' }
    area_id { 2 }
    town { 'ナメック星' }
    town_number { '1-1' }
    building_name { 'ピッコロの家' }
    phone_number { '09012345678' }

    token { 'tok_abcdefghijk00000000000000000' }
  end
end
