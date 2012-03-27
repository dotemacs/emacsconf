Emacsconf::Application.routes.draw do
  devise_for :users

  resources :proposals
  root :to => 'proposals#index'
end
