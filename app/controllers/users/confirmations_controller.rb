class EmailIdentities::ConfirmationsController < Devise::ConfirmationsController
  include FlashActiveRecordErrors

  add_active_record_errors_to_flash :create
end
