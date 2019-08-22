require 'rails_helper'

RSpec.feature 'Register', type: :feature do
  scenario 'new user register with valid email and password' do
    login_with 'valid@example.com', 'password'

    expect(page).to have_content('Share a movie')
    expect(page).to have_content('Logout')
  end

  scenario 'existing user login' do
    user = create(:user, password: 'password')

    login_with user.email, 'password'

    expect(page).to have_content('Share a movie')
    expect(page).to have_content('Logout')
  end

  scenario 'invalid user email' do
    user = create(:user, password: 'password')

    login_with user.email, 'password'

    expect(page).to have_content('Share a movie')
    expect(page).to have_content('Logout')
  end

  def login_with(email, password)
    visit root_path
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_button 'Login / Register'
  end
end
