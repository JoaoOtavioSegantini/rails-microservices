Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth/v1/user'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :admin do
    namespace :v1 do
    end
  end

  namespace :storefront do
    namespace :v1 do
    end
  end
  
end
