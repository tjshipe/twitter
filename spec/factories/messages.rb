# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    body "MyText"
    sender { FactoryGirl.create(:user) }
    receiver { FactoryGirl.create(:user) }
  end
end
