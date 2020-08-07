Rails.application.routes.draw do
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get 'articles/new'

  resources :articles do
    resources :comments
  end

  #make welcome index the homepage
  root 'welcome#index'
end
