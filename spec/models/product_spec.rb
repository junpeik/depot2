require 'rails_helper'

describe Product do
  let(:product) { FactoryGirl.create(:product) }

  it 'title should not be blank' do
    product.title = ' '
    expect(product).not_to be_valid
  end

  it 'description should not be blank' do
    product.description = ' '
    expect(product).not_to be_valid
  end

  it 'image_url should not be blank' do
    product.image_url = ' '
    expect(product).not_to be_valid
  end

end