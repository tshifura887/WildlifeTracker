Rails.application.routes.draw do
  resources :animals do
    resources :sightings
  end
  resources :regions
  root 'animals#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
