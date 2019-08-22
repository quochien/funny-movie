require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  render_views

  describe 'GET index' do
    let!(:movie1) { create(:movie) }
    let!(:movie2) { create(:movie) }

    it "renders 'index' with movies" do
      get :index

      expect(response).to render_template(:index)
      expect(assigns(:movies)).to eq([movie2, movie1])
    end
  end
end
