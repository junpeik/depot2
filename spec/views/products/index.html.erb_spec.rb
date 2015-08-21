require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :title => "Title",
        :description => "MyText",
        :image_url => "image.jpg",
        :price => "9.99"
      ),
      Product.create!(
        :title => "Title2",
        :description => "MyText",
        :image_url => "image.jpg",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 1
    assert_select "tr>td", :text => "MyText".to_s, :count => 1
    assert_select "tr>td", :text => "image.jpg".to_s, :count => 1
    assert_select "tr>td", :text => "9.99".to_s, :count => 1

    assert_select "tr>td", :text => "Title2".to_s, :count => 1
    assert_select "tr>td", :text => "MyText".to_s, :count => 1
    assert_select "tr>td", :text => "image.jpg".to_s, :count => 1
    assert_select "tr>td", :text => "9.99".to_s, :count => 1
  end
end
