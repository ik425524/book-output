Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'
  get 'home',to: 'home#top'
  get 'texts',to: 'texts#index'
  get 'texts/new', to: 'texts#new'
  get 'texts/:id', to: 'texts#show'
  post 'texts/create', to: 'texts#create'
end
