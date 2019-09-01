Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#index'
  get '/homepage', to: 'welcome#homepage'
  resources :sessions, only: [:index, :new, :create]
  resources :users, only: [:new, :create, :show]
end
