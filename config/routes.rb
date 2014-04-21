TextingApp::Application.routes.draw do
  devise_for :users

  resources :users, :only => [:index, :show] do
    resources :messages
    resources :contacts
  end

  resources :welcome, :only => :index
  root to: 'welcome#index'
end
