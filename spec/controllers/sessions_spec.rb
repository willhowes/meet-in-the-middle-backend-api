require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do

      it "renders a JSON response with the new session" do
        @user = User.new(name: 'Test User', email: 'test@user.com',
                         password: '123456', password_confirmation: '123456')
        @user.save
        post :create, params: {session: {email: @user.email, password: @user.password}}
        expect(response.content_type).to eq('application/json; charset=utf-8')
        last_user_id = User.last.id
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['id']).to eq last_user_id 
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new session" do
        @user = User.new(name: 'Test User 2', email: 'test@user2.com',
                         password: '123456', password_confirmation: '123456')
        @user.save
        post :create, params: {session: {email: @user.email, password: "hello123"}}
        expect(response).to have_http_status(401)
      end
    end
  end

  describe '#destroy' do
    it "ends the current session succesfully" do
      @user = User.new(name: 'Test User', email: 'test@user.com',
                       password: '123456', password_confirmation: '123456')
      @user.save
      post :create, params: {session: {email: @user.email, password: @user.password}}
      last_user_id = User.last.id
      delete :destroy, params: { id: last_user_id }
      expect(response).to have_http_status(:success)
    end

    it 'fails if no ID given' do
      expect{ delete :destroy }.to raise_error(ActionController::UrlGenerationError)
    end
  end
end
