Emacsconf::Application.routes.draw do
  devise_for :users

  resources :proposals do
    get 'vote_up', :on => :member
    get 'vote_down', :on => :member
    resources :comments
  end

  root :to => 'proposals#index'
end
