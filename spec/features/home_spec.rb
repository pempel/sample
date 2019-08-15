require 'rails_helper'

RSpec.describe 'Home page', type: :feature do
  fixtures :users

  scenario 'a not logged-in user cannot view this page' do
    visit '/'

    expect(page).to have_button('Log in')
  end

  scenario 'a logged-in user can view this page' do
    log_in('homer', 'homer')

    expect(page).to have_content('Home, sweet home')
  end

  scenario 'a logged-in user can log out' do
    log_in('homer', 'homer')

    click_link('Log out')

    expect(page).to have_content('Login')
  end

  def log_in(nickname, password)
    visit '/login'
    fill_in 'Nickname', with: nickname
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end
