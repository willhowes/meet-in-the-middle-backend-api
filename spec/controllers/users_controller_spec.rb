require 'rails_helper'

RSpec.describe UsersController, :type => :request do
  describe 'POST /users' do
    subject { post '/users', params: params }

    let(:params) { { user: { name: name, email: email, password: password,
      password_confirmation: password, avatar: avatar } } }
    let(:name) { 'Test User' }
    let(:email) { 'test@test.com' }
    let(:password) { '123456' }
    let(:avatar) { fixture_file_upload('avatar.jpeg') }

    context 'valid request' do
      it 'returns status created' do
        subject
        expect(response).to have_http_status :created
      end

      it 'returns a JSON response' do
        subject
        expect(JSON.parse(response.body)).to include(
          {
            'id' => User.last.id,
          }
        )
      end

      it 'creates a user' do
        expect { subject }.to change { User.count }.from(0).to(1)
      end

      it 'creates a blob ' do
        expect { subject }.to change { ActiveStorage::Blob.count }.from(0).to(1)
      end
    end
  end
end
