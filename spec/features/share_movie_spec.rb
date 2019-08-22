require 'rails_helper'

RSpec.feature 'Share a movie', type: :feature do
  scenario 'signed in user shares a movie' do
    user = create(:user, password: 'password')

    login_with(user.email, 'password')
    click_link 'Share a movie'
    fill_in 'movie_youtube_url', with: 'https://www.youtube.com/watch?v=sX3KeP7v7Kg'
    fill_in 'movie_title', with: 'movie title'
    fill_in 'movie_description', with: 'movie description'
    click_button 'Share'

    expect(page).to have_content('You have just shared a movie!')
    expect(page).to have_content('movie title')
    expect(page).to have_content('movie description')
    expect(page).to have_content("Shared by: #{user.email}")
  end

  def login_with(email, password)
    visit root_path
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_button 'Login / Register'
  end
end
