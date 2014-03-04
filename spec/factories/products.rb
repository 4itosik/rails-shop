# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
  	name "name"
  	body "body"
  	sequence(:alias) { |i| "alias#{i}"}
  	subcategory_id 100
  	subcategory
  	price 1
  end
end
