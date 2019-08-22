require 'rails_helper'

RSpec.describe Users::SessionsController do
  before { @request.env['devise.mapping'] = Devise.mappings[:user] }

  describe 'register' do
    context 'invalid email' do
      it 'does not create user' do
        expect do
          post :create,
            params: {
              user: {
                email: 'dummy',
                password: 'password'
              }
            }
        end.to_not change { User.count }

        expect(response).to render_template(:new)
      end
    end

    context 'valid email & password' do
      it 'creates user' do
        expect do
          post :create,
            params: {
              user: {
                email: 'dummy@test.com',
                password: 'password'
              }
            }
        end.to change { User.count(1) }

        expect(response).to redirect_to(root_path)
      end
    end

    context 'existing user' do
      let!(:user) { create(:user, password: 'password') }

      it 'can login' do
        expect do
          post :create,
            params: {
              user: {
                email: user.email,
                password: 'password'
              }
            }
        end.to_not change { User.count }

        expect(response).to redirect_to(root_path)
      end
    end
  end
end
