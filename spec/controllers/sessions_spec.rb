require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a email on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe SessionsController, type: :controller do
  before(:each) do
    @user = User.new(name: 'Test User', email: 'test@user.com',
                     password: '123456', password_confirmation: '123456')
  end

 #
 #  let(:user) { User.new(name: 'Test User', email: 'test@user.com',
 #                   password: '123456', password_confirmation: '123456')
 # }


  # This should return the minimal set of attributes required to create a valid
  # Session. As you add validations to Session, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { email: user.email, password: "123456" }
  }

  let(:invalid_attributes) {
    { email: user.email, password: "hoopyhoop" }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SessionsController. Be sure to keep this updated too.
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

        # expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)).to include(
          # "session_key" => User.last.session_key,
          # "id"=>User.last.id
          "id"=>100
        )
      end
    end

    # context "with invalid params" do
    #   it "renders a JSON response with errors for the new session" do
    #     post :create, params: {session: invalid_attributes}, session: valid_session
    #     expect(response).to have_http_status(:unprocessable_entity)
    #     expect(response.content_type).to eq('application/json')
    #   end
    # end
  end
end
