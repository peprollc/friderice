FactoryBot.define do
  factory :shop, class: Shop do
    sequence(:name) { |n| "来華#{n}" }
    address "東京都墨田区押上１丁目２７−１"
  end
end
