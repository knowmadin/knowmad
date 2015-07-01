class Identities::PasswordsController < Devise::PasswordsController
  include FlashActiveRecordErrors

  add_active_record_errors_to_flash :create, :update
end
