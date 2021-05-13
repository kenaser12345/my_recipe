Rails.application.routes.draw do
  devise_for :users
  root "recipes#index"

  resources :recipes do
    resources :steps do
    end
  end

  resources :ingredients
end
