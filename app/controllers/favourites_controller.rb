class FavouritesController < ApplicationController
  before_action :set_favourite, only: [:show, :update, :destroy]

  # GET /favourites
  def index
    @favourites = Favourite.all
    json_response(@favourites)
  end

  # POST /favourites
  def create
    #
    # @location = Location.create(params[:lat, :long], session[:user_id])
    @user = User.find(session[:user_id])
    # @user.add_favourite_location(@location.id) ?

    @favourite = Favourite.create!(favourite_params)
    json_response(@favourite, :created)
  end

  # GET /favourites/:id
  def show
    json_response(@favourite)
  end

  # PUT /favourites/:id
  def update
    if @favourite.update(favourite_params)
      render json: @favourite
    else
      render json: @favourite.errors, status: unprocessable_entity
    end
  end

  # DELETE /favourites/:id
  def destroy
    @favourite.destroy
  end

  private

  def favourite_params
    params.permit(:location, :location_name)
  end

  def set_favourite
    @favourite = Favourite.find(params[:id])
  end
end
