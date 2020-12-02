Rails.application.routes.draw do
  resources :costumes

  resources :actors, only: [:new, :show, :index]
  # new and create are nested

  devise_for :users, :controllers => {registrations: "registrations", omniauth_callbacks: "callbacks"}
    #change route from /users/login to /login route
    devise_scope :user do
      get 'login', to: 'devise/sessions#new'
    end

    devise_scope :user do
      get 'signup', to: 'devise/registrations#new'
      get 'users/:id', to: 'users#show', as: 'user'
    end
    
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: "application#home"
end
