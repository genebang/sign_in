SignIn::Application.routes.draw do

  resources :users
  root to: "users#index"

  match 'auth/:provider', to: 'sessions#create', as: 'oauth'
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')

  match 'signin', to: 'sessions#new'
  match 'signout', to: 'sessions#destroy'

end
