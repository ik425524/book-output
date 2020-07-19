Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'
  namespace :texts do
    resources :searches, only: :index
  end
  get 'home',to: 'home#top'
  get 'texts',to: 'texts#index'
  get 'texts/new', to: 'texts#new'
  post 'texts/create', to: 'texts#create'
  get 'texts/:id', to: 'texts#show'
  get 'texts/:id/edit', to: 'texts#edit'
  post 'texts/:id/update', to: 'texts#update'
  post 'texts/:id/destroy', to: 'texts#destroy'
end
