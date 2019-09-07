class SessionsController < ApplicationController

  def create
    user = User
            .find_by(email: params[:session][:email])
            .try(:authenticate, params[:session][:password])

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render nothing: true, status: :unauthorized
    end
  end

  def destroy
    reset_session
  end
end
