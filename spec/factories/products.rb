# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
  	name "name"
  	body "body"
  	sequence(:alias) { |i| "alias#{i}"}
  	subcategory 1
  	price 1
  end
end
