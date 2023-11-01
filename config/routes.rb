Rails.application.routes.draw do

  resources :cheffs

  resources :customers do
    collection do
      get 'show_chefs', to: 'customers#show_chefs'
    end
  end

  get 'login/index'
  root 'login#index'
  
end
