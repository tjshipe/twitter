FactoryGirl.define do
  factory :post do
    body "This is a tweet"
    user
  end
end