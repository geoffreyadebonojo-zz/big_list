Rails.application.routes.draw do

  get '/', to: 'welcome#index'
  resources :notes
  resources :music
  resources :items, only: [:index, :show, :new, :create, :edit, :update]
end
