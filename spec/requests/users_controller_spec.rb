require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /index' do
    it 'should return http index success' do
      get('/users')
      expect(response).to have_http_status(:success)
    end
    it 'should return http index success' do
      get('/users')
      expect(response).to render_template(:index)
    end
    it 'the body should include the correct placeholder text' do
      get('/users')
      expect(response.body).to include('Here is a list of all users')
    end
  end

  describe 'GET /show' do
    it 'should return http show success' do
      get '/users/:id', params: { id: 1 }
      expect(response).to have_http_status(:success)
    end
    it 'should return render template Show' do
      get '/users/:id', params: { id: 1 }
      expect(response).to render_template(:show)
    end
    it 'the body should include the correct placeholder text' do
      get '/users/:id', params: { id: 1 }
      expect(response.body).to include('This is a place holder to show a user')
    end
  end
  