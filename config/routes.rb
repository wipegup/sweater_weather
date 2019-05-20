Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'forecast#show'
      post 'sessions', to: 'sessions#create'
      get 'backgrounds', to: 'backgrounds#show'
      resources :favorites, only: [:index, :create]
      delete 'favorites', to: 'favorites#destroy'
    end

  end
end
