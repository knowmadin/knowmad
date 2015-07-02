class Identities::Email::RegistrationsController < Devise::RegistrationsController
  include FlashActiveRecordErrors

  add_active_record_errors_to_flash :create, :update
end
