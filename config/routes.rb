Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'forecast#show'
      get 'backgrounds', to: 'backgrounds#show'
      resources :sessions, only: [:create]
      resources :favorites, only: [:index, :create]
      delete 'favorites', to: 'favorites#destroy'
      resources :users, only: [:create]
      get 'antipode', to: 'antipode#show'
    end

  end
end
