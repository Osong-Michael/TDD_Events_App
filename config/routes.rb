Rails.application.routes.draw do
  root 'events#index'
  get 'events' => 'events#index'
  get 'events/:id' => 'events#show', as: 'event'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
