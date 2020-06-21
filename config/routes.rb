Rails.application.routes.draw do
  resources :registrations
  root 'events#index'
  # get 'events' => 'events#index'
  # get 'events/new' => 'events#new'
  # get 'events/:id' => 'events#show', as: 'event'
  # get 'events/:id/edit' => 'events#edit', as: 'edit_event'
  # patch 'events/:id' => 'events#update'
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
