Rails.application.routes.draw do

  resources :notes
  resources :videos
  get '/', to: 'welcome#index'
  get '/iframe_viewer', to:'iframe_viewer#index'
  resources :music

  resources :items, only: [:index, :show, :new, :create, :edit, :update]
end
