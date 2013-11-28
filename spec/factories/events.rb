# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title Faker::Lorem.sentence
    starts_at Time.now
  end

  factory :past_event, parent: :event do |f|
    f.starts_at 1.day.ago
  end
end
