Rails.application.routes.draw do
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  root 'dockets#index'

  resources :dockets
  resources :addresses
  resources :hazardous_goods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
