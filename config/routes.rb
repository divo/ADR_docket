Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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

  controller :help do
    get 'help' => :new
    post 'help' => :create
  end
end
