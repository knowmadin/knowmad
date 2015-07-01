require 'resque_web'
ResqueWeb::Engine.eager_load!

Rails.application.routes.draw do
  mount ResqueWeb::Engine => '/resque_web'

  root to: 'home#index'

  devise_for :email_identity, path: 'auth', path_names: {
      sign_in:      'sign_in',
      sign_out:     'sign_out',
      registration: 'account'
    },
    controllers: {
      registrations:      'users/registrations',
      confirmations:      'users/confirmations',
      sessions:           'users/sessions',
      passwords:          'users/passwords',
      omniauth_callbacks: 'users/omniauth_callbacks'
    }

  devise_scope :facebook_identity do
    delete 'facebook/logout' => 'users/sessions#destroy', as: :facebook_logout
  end
  devise_for :facebook_identity
end
