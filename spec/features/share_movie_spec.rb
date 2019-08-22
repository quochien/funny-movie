require 'rails_helper'

RSpec.feature 'Share a movie', type: :feature do
  before do
    visit new_movie_path
  end
end
