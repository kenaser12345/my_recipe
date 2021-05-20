Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :recipes do
    resources :steps do
    end
    collection do 
      get :add_ingredient
    end
  end

  resources :ingredients
end
