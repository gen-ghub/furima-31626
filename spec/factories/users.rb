FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '名字' }
    second_name           { '名前' }
    kana_first_name       { 'カナミョウジ' }
    kana_second_name      { 'カナナマエ' }
    birthday              { '1930-01-01' }
  end
end
