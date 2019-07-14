Rails.application.routes.draw do
  resources :questions do
    resources :answers
  end

  get 'answers/index_answers', as: ''
  get 'index_answers', to: 'answers#index_answers', as: 'answers_index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'pages/index'
  root to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
