class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :email, :home_location, :work_location, :avatar_path

  def avatar_path
    rails_blob_path(object.avatar, only_path: true) if object.avatar.attached?
  end
end
