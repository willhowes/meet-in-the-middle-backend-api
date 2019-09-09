require 'rails_helper'
require 'favourites_spec_helper'

RSpec.describe FavouritesController do

  describe 'POST /favourites' do
    # it "renders a JSON response with the new session" do
    #   @favourite = Favourite.new(location: 'Test', location_name: 'Work',
    #                    user_id: 1)
    #   post :create, params: {favourite: {location: @favourite.location, location_name: @favourite.location_name, user_id: @favourite.user_id}}
    #   expect(response.content_name).to eq('application/json; charset=utf-8')
    #   last_favourite_id = Favourite.last.id
    #   parsed_response = JSON.parse(response.body)
    #   expect(parsed_response['favourite']['id']).to eq last_favourite_id
    # end
    subject { post '/favourites', params: valid_attributes }

    let(:valid_attributes) { { favourite: { location: '50 Commercial St, Spitalfields, London E1 6LT, UK', location_name: 'Work', user_id: 1 } } }
    context 'valid request' do
      it 'returns status created' do
        subject
        expect(response).to have_http_status :created
      end
    end

    context 'when the request is valid' do
      before { post '/favourites', params: valid_attributes }

      it 'creates a favourite' do
        expect(json['location']).to eq('50 Commercial St, Spitalfields, London E1 6LT, UK')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/favourites', params: { location_name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Location can't be blank/)
      end
    end
  end

  # Test suite for PUT /favourites/:id
  describe 'PUT /favourites/:id' do
    let(:valid_attributes) { { location: '50 Commercial St, Spitalfields, London E1 6LT, UK', location_name: 'Work', user_id: 1 } }

    context 'when the record exists' do
      before { put "/favourites/#{favourite_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to include( {
          'id' => favourite_id
          })
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /favourites/:id
  describe 'DELETE /favourites/:id' do
    before { delete "/favourites/#{favourite_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
