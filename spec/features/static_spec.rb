require 'rails_helper'

feature 'Static', type: :feature do

  feature 'Home' do
    scenario 'header presents' do
      visit root_path
      expect(page).to have_selector 'h1'
    end
  end

end
