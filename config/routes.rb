Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :entries
  #
  resources :users
  #   get '/entries', to: 'entries#index'
  # end

  get '/users/login', to: 'users#login', as: "user_login"

  post '/users/signup', to: 'users#signup', as:"user_signup"

  get '/users/:user_id/entries', to: 'entries#index', as: "user_entries"

end
