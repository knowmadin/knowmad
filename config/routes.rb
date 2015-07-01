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
      registrations:      'identities/email/registrations',
      confirmations:      'identities/email/confirmations',
      sessions:           'identities/sessions',
      passwords:          'identities/email/passwords',
      omniauth_callbacks: 'identities/social/omniauth_callbacks'
    }

  devise_scope :facebook_identity do
    delete 'facebook/logout' => 'identities/sessions#destroy', as: :facebook_logout
  end
  devise_for :facebook_identity
end
