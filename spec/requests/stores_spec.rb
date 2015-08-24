require 'rails_helper'

describe 'StoresController' do

  subject { page }

  describe 'index' do
    before do
      5.times { FactoryGirl.create(:product) }
      visit root_path
    end

    it 'shows product lists' do
      expect(page).to have_selector('h3', count: 5)
    end
  end
end