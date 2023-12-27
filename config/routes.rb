Rails.application.routes.draw do
  
  resources :users do
    post 'login', to: 'authentication#login'
  end

  resources :ticket_bookings
  resources :tickets
  resources :customers
  resources :event_organigers
  resources :events

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
