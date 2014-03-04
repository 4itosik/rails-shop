# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subcategory do
  	name "test category"
  	sequence(:alias) { |i| "alias#{i}"}
  	category
  end
end
