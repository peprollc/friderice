FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "username_#{n}" }
  end
end