Rails.application.routes.draw do
  scope "(:locale)", locale: /ja|en/ do

    get '/' => 'user/sessions#index'

    namespace :operator do

      get    'sign_in'         => 'sessions#index'
      post   'sign_in'         => 'sessions#create'
      delete 'sign_out'        => 'sessions#destroy'

      resources :users
      resources :vocabularies
    end

    #This is namespace user
    namespace :user do

      get    'sign_in'         => 'sessions#index'
      post   'sign_in'         => 'sessions#create'
      get 'sign_out'        => 'sessions#destroy'

      get '/get_vocabulary_by_lesson' => 'vocabularies#get_vocabulary_by_lesson'

      resources :users
      resources :homes
      resources :vocabularies, only: [:index]
      resources :practices
    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
