require 'rails_helper'

describe Product do
  let(:product) { FactoryGirl.create(:product) }

  describe 'presence test' do

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

  describe 'image_url extension' do

    let(:valid_extension) { %w(fred.gif fred.jpg fred.png FRED.jpg FRED.Jpg http://a.b.c/x/y/z/fred.gif) }
    let(:invalid_extension) { %w(fred.doc fred.gif/more fred.gif.more) }

    context 'valid extension' do
      it 'should be valid' do
        valid_extension.each do |v_extension|
          product.image_url = v_extension
          expect(product).to be_valid
        end
      end
    end

    context 'invalid extension' do
      it 'should be invalid' do
        invalid_extension.each do |inv_extension|
          product.image_url = inv_extension
          expect(product).not_to be_valid
        end
      end
    end
  end

  describe 'product price must be positive' do

    context 'when price is -1' do
      it 'should be invalid' do
        product.price = -1
        expect(product).not_to be_valid
      end
    end

    context 'when price is 0' do
      it 'should be invalid' do
        product.price = 0
        expect(product).not_to be_valid
      end
    end

    context 'when price is 1' do
      it 'should be valid' do
        product.price = 1
        expect(product).to be_valid
      end
    end
  end

end