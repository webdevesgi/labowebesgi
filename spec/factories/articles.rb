# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.sentence(10) }
    content { Faker::Lorem.paragraph(3) }
    user { FactoryGirl.build(:user) }
  end
end
