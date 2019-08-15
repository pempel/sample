require 'rails_helper'

RSpec.describe 'Home page', type: :feature do
  scenario 'a user views the home page' do
    visit '/'

    expect(page).to have_content('Home, sweet home')
  end
end
