module FavouritesSpecHelper
  def json
    JSON.parse(response.body)
  end 
end
