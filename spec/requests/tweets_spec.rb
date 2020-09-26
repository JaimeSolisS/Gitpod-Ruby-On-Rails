require 'rails_helper'

RSpec.describe 'Tweets API' do
  # Initialize the test data
  let!(:user) { create(:user) }
  let!(:tweets) { create_list(:tweet, 20, user_id: user.id) }
  let(:user_id) { user.id }
  let(:id) { tweets.first.id }

  # Test suite for GET /todos/:todo_id/items
  describe 'GET /users/:user_id/tweets' do
    before { get "/users/#{user_id}/tweets" }

    context 'when user exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all user tweets' do
        expect(json.size).to eq(20)
      end
    end

    context 'when user does not exist' do
      let(:user_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  # Test suite for GET /todos/:todo_id/items/:id
  describe 'GET /users/:user_id/tweets/:id' do
    before { get "/users/#{todo_id}/tweets/#{id}" }

    context 'when user tweet exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the tweet' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when user tweet does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Tweet/)
      end
    end
  end

  # Test suite for PUT /todos/:todo_id/items
  describe 'POST /users/:user_id/tweets' do
    let(:valid_attributes) { { text: 'Hello' } }

    context 'when request attributes are valid' do
      before { post "/users/#{user_id}/tweets", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/users/#{user_id}/tweets", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: text can't be blank/)
      end
    end
  end

  # Test suite for PUT /todos/:todo_id/items/:id
  describe 'PUT /users/:user_id/tweets/:id' do
    let(:valid_attributes) { { username: '@someone', name:'me', avatar:'pic1' } }

    before { put "/users/#{user_id}/tweets/#{id}", params: valid_attributes }

    context 'when tweet exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the tweet' do
        updated_tweet = Tweet.find(id)
        expect(updated_tweet.username).to match(/@someone/)
      end
    end

    context 'when the tweet does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Tweet/)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /users/:id' do
    before { delete "/users/#{user_id}/items/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end