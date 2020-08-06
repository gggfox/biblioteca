Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get    'sessions/new'
  get    'users/new'
  get    'static_pages/home'
  get    '/help',       to:  'static_pages#help'
  get    '/about',      to:  'static_pages#about'
  get    '/contact',    to:  'static_pages#contact'
  get    '/signup',     to:  'users#new'
  get    '/login',      to:  'sessions#new'
  post   '/login',      to:  'sessions#create'
  delete '/logout',     to:  'sessions#destroy'
  root   'static_pages#home'
  resources :users
  resources :reviews,   only: [:show, :create, :destroy]
  resources :comments,  only: [:create, :destroy]
end
