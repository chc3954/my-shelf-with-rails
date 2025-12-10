Rails.application.routes.draw do
  resource :session, only: [ :new, :create, :destroy ]
  resource :registration, only: [ :new, :create ]
  resources :passwords, param: :token
  resources :documents, only: [ :index, :create, :destroy ]

  root "documents#index"
end
