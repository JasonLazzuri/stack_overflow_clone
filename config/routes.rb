Rails.application.routes.draw do
  devise_for :users
  root :to => 'questions#index'
  get 'answers/index'

  get 'answers/new'

  get 'answers/edit'

  get 'answers/show'

  get 'questions/index'

  get 'questions/new'

  get 'questions/edit'

  get 'questions/show'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  resources :questions do
    resources :answers
  end
end
