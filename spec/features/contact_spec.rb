require 'rails_helper'

feature 'Contact', type: :feature do

  scenario 'header presents' do
    visit contact_path
    expect(page).to have_selector 'h1'
  end

end
