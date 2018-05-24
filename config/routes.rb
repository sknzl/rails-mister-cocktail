Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      resources :cocktails, only: [:index, :create, :new, :show, :destroy ]  do
        resources :doses, only: [:create, :new]
  end
  resources :doses, only: [:destroy]

  resources :ingredients, only: [:index, :create, :new, :destroy]
end
