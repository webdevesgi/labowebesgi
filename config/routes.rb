Labowebesgi::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "home#index"
  devise_for  :users,
              controllers:  { registrations: "registrations" },
              path_names:   {
                              sign_in:  'login',
                              sign_up:  'signup',
                              sign_out: 'logout'
                            }
  resources :users, only: [:show]
  resources :articles, only: [:index, :show]
  resources :events, only: [:index, :show] do
    get 'next', on: :collection
    get 'past', on: :collection
    member do
      get 'subscribe'
    end
  end
end