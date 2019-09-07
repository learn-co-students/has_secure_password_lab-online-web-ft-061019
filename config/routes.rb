Rails.application.routes.draw do
  root 'sessions#index'
  get '/homepage', to: 'welcome#homepage'
  resources :sessions, only: [:index, :new, :create]
  resources :users, only: [:show, :new, :create]
  get 'user/create'

  get 'user/show'

  get 'user/new'

  get 'sessions/create'

  get 'sessions/index'

  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
