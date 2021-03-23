Rails.application.routes.draw do
  # enables all routes for costumes
  resources :costumes

  # enables show and index routes for actors, and nested show, new, and edit routes for costumes
  resources :actors, only: [:show, :index] do
    resources :costumes, only: [:show, :new, :edit]
  end

  # allows devise to handle authentication
  devise_for :users, :controllers => {registrations: "registrations", omniauth_callbacks: "callbacks"}
    #change route from /users/login to /login route
    devise_scope :user do
      get 'login', to: 'devise/sessions#new'
    end

    devise_scope :user do
      get 'signup', to: 'devise/registrations#new'
    end
    
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: "application#home"
end
