Rails.application.routes.draw do
  get 'signup' => 'users#new'
  resources :users
  root 'events#index'
  resources :events do
    resources :registrations
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
