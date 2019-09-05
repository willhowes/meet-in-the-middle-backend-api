require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before(:each) do
    @user = User.new(name: 'Test User', email: 'test@user.com',
                     password: '123456', password_confirmation: '123456')
  end

  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do
      before(:each) do
        @user = User.new(name: 'Test User', email: 'test@user.com',
                         password: '123456', password_confirmation: '123456')
        @user.save
      end
      it "renders a JSON response with the new session" do
        p @user
        post :create, params: {session: {email: @user.email, password: @user.password}}
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)).to include(
          # "session_key" => User.last.session_key,
          "id"=>User.last.id
        )
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new session" do
        post :create, params: {session: {email: @user.email, password: @user.password}}
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end
end
