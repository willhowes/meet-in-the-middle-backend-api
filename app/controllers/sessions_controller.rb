class SessionsController < ApplicationController
  INVALID_AUTH_ERRORS = { password: "Invalid username or password" }

  # POST /sessions
  def create
    p 'USER'
    p params


    user = User.find_by(email: params[:session][:email])
    if user.authenticate(params[:session][:password])
      render json: {
        user_id: user.id,
        session_key: user.generate_session_key!
      }, status: :created
    else
      render json: { errors: INVALID_AUTH_ERRORS }, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
