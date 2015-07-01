class EmailIdentities::SessionsController < Devise::SessionsController
  include FlashActiveRecordErrors

  add_active_record_errors_to_flash :create
end
