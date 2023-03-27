Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :tasks
  # resources :tasks do
  #   resources :tasks
  # end
  resources :tasks do
    resources :tasks, only: [:create]
  end
  
  post 'signup', to: 'users#create'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
end
