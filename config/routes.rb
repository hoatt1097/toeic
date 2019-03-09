Rails.application.routes.draw do

  scope "(:locale)", locale: /ja|en/ do

    get '/' => 'user/sessions#new'

    namespace :operator do

      get    'sign_in'         => 'sessions#new'
      post   'sign_in'         => 'sessions#create'
      delete 'sign_out'        => 'sessions#destroy'

      resources :users
    end

    #This is namespace user
    namespace :user do

      get    'sign_in'         => 'sessions#new'
      post   'sign_in'         => 'sessions#create'
      get 'sign_out'        => 'sessions#destroy'

      resources :users
      resources :homes
    end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
