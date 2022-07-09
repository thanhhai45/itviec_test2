Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :subscribes
  resources :posts
  resources :users do
    member do
      get :unsubscribe
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
