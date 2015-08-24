namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    make_products
  end
end

def make_products
  images = %w(cs.jpg rtp.jpg ruby.jpg)
  50.times do |n|
    title = "product#{n}"
    description = Faker::Lorem.sentence(30)
    image = images[n%3]
    price = 100
    Product.create!(title: title,
                    description: description,
                    image_url: image,
                    price: price)
  end
end