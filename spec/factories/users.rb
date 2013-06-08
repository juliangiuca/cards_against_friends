# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "John Doe"
    sequence(:email){|n| "user#{n}@example.com" }
    password "123test1"
    password_confirmation "123test1"
  end
end
