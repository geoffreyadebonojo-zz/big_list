Rails.application.routes.draw do

  get '/', to: 'welcome#index'
  resources :items, only: [:index, :show]
end
