Rails.application.routes.draw do
  resource :session, only: [ :new, :create, :destroy ]
  resources :passwords, param: :token
  resources :documents, only: [ :index, :create, :destroy ]

  root "documents#index"
end
