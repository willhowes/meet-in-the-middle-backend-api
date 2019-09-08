Rails.application.routes.draw do
    resources :users
    resources :sessions, only: [:create, :destroy]
    resources :users, only: %i[create show] do
      get :avatar, on: :member
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
