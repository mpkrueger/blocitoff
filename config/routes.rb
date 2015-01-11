Rails.application.routes.draw do

  get 'items/new'

  get 'items/create'

  devise_for :users

  resources :lists, except: [:index] do
    resources :items, only: [:create, :destroy]
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
