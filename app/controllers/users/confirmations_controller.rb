class Users::ConfirmationsController < Devise::ConfirmationsController
  def create
    super do |resource|
      if resource.errors.any?
        flash[:error] = resource.errors.full_messages.to_sentence
      end
    end
  end
end
