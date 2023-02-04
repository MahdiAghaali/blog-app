require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      get '/users'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    before :each do
      @user = User.create(name: 'Tom',
                          bio: 'Teacher from Mexico.',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          postsCounter: 0)
    end

    it 'returns http success' do
      get "/users/#{@user.id}"
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      get "/users/#{@user.id}"
      expect(response).to render_template(:show)
    end
  end
end
