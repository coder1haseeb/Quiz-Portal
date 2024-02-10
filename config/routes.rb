# config/routes.rb

Rails.application.routes.draw do
  resources :tests do
    resources :finals
    resources :results
  end
  root 'home#index'

  devise_for :users, controllers: {
    registrations: "registrations"
  }
  
  resources :students
# config/routes.rb
  resources :assignments
  resources :tests do
    resources :questions do
      resources :options
    end
    resources :blanks
    resources :truefalses
  end

  resources :tests do
    resources :submits
  end

  namespace :api do
    namespace :v1 do
      resources :tests
    end
  end

end