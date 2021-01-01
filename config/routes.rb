Rails.application.routes.draw do
  root 'dockets#index'

  resources :dockets
  resources :addresses
  resources :hazardous_goods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
