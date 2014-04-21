TextingApp::Application.routes.draw do
  devise_for :users

  resources :users, :only => [:index, :show] do
    resources :messages
    resources :contacts
  end

  resources :welcome, :only => :index

  authenticated :user do
    root :to => 'users#show', as: :authenticated_root
  end
  root :to => 'welcome#index'
end
