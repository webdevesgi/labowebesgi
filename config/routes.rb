Labowebesgi::Application.routes.draw do
  resources :articles

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "home#index"
  devise_for  :users,
              controllers:  { registrations: "registrations" },
              path_names:   {
                              sign_in:  'login',
                              sign_up:  'signup',
                              sign_out: 'logout'
                            }
  resources :users
end