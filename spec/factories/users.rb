# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    pwd = Faker::Lorem.characters(10)
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password pwd
    password_confirmation pwd
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end

  factory :user_missing_email, parent: :user do
    email ''
  end

  factory :user_missing_password, parent: :user do
    password ''
    password_confirmation ''
  end

  factory :user_different_password_confirmation, parent: :user do
    password_confirmation { Faker::Lorem.characters(10) }
  end

  factory :user_too_short_password, parent: :user do |f|
    pwd = Faker::Lorem.characters(5)
    f.password pwd
    f.password_confirmation pwd
  end

  factory :user_with_subscribed_events, parent: :user do
    after(:create) do |user|
      user.events_subscribed << FactoryGirl.create(:event)
    end
  end
end
