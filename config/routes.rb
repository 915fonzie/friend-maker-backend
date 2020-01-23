Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      get '/interests', to: 'interests#index'
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      post '/find_matches_by_greatest', to: 'users#find_from_greatest'
      get '/find_matches_by_least', to: 'users#find_from_least'
    end
  end
end
