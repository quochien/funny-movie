require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:user) { create(:user) }

  render_views

  describe 'GET new' do
    context 'without signed in user' do
      it 'redirects to signin page' do
        get :new

        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'with signed in user' do
      before { sign_in user }

      it 'renders new movie' do
        get :new

        expect(response).to render_template(:new)
        expect(assigns(:movie)).to be_present
      end
    end
  end

  describe 'POST create' do
    let(:movie_params) do
      {
        movie: {
          title: 'Stars war',
          description: 'War of stars',
          youtube_url: 'https://www.youtube.com/watch?v=sX3KeP7v7Kg'
        }
      }
    end

    context 'without signed in user' do
      it 'redirects to signin page' do
        expect do
          post :create, params: movie_params
        end.to_not change { Movie.count }

        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'with signed in user' do
      before { sign_in user }

      context 'successful' do
        it 'creates new movie' do
          expect do
            post :create, params: movie_params
          end.to change { Movie.count }.by(1)

          expect(response).to redirect_to(root_path)
          expect(flash[:success]).to eq('You have been shared a movie!')
        end
      end

      context 'failed' do
        before do
          allow_any_instance_of(Movie).to receive(:save).and_return(false)
        end

        it 'does not create movie' do
          expect do
            post :create, params: movie_params
          end.to_not change { Movie.count }

          expect(response).to render_template(:new)
          expect(flash[:error]).to eq('Could not share the movie!')
        end
      end
    end
  end
end
