class SessionsController < ApplicationController

  def create
    user = User
            .find_by(email: params[:session][:email])
            .try(:authenticate, params[:session][:password])

    if user
      puts "all ok"
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      puts "error message"
      # render json: { status: 401 }
      render nothing: true, status: :unauthorized
    end
  end
end
