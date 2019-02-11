Rails.application.routes.draw do

  get '/', to: 'welcome#index'
  resources :music

  resources :items, only: [:index, :show, :new, :create, :edit, :update]
end
