TextingApp::Application.routes.draw do
  devise_for :users

  resources :users, :only => [:index, :show] do
    resources :messages
    resources :contacts
  end


  root to: 'message#index'
end
