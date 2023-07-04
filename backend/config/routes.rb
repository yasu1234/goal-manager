Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'signup'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'sessions#guest_sign_in'
  end

  get '/current_user', to: 'user#current_user_json', defaults: { format: :json }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
