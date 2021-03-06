include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    avatar { fixture_file_upload("#{Rails.root}/public/avatars/original/missing.png", 'image/png') }

    trait :confirmed do
      confirmed_at Time.current
    end

    trait :onboarded do
      date_joined { Faker::Date.between(1.month.ago, 3.years.ago) }
      title { Faker::Name.title }
      onboarded_at { Faker::Date.between 1.month.ago, 1.week.ago }
    end
  end
end
