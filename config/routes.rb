Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  post 'sessions/create', to: 'sessions#create' 
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
