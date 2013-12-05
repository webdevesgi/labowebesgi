# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :talk do
    title { Faker::Lorem.sentence(10) }
    description { Faker::Lorem.paragraph(1) }
    speaker { FactoryGirl.build(:user) }
    event { FactoryGirl.build(:event) }
  end
end
