FactoryGirl.define do
  factory :product do
    sequence(:title) { |n| "product_#{n}" }
    sequence(:description) { Faker::Lorem.sentence }
    image_url 'ruby.jpg'
    price 100
  end
end