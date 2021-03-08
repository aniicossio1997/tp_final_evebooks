Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do    
    namespace :v1 do
      resources :users, only: %i[show create update destroy index]
      resources :tokens, only: [:create]
      resources :books, only: %i[show index create update]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
