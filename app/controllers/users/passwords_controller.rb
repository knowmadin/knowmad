class Users::PasswordsController < Devise::PasswordsController
  def create
    super do |resource|
      if resource.errors.any?
        flash[:error] = resource.errors.full_messages.to_sentence
      end
    end
  end

  def update
    super do |resource|
      if resource.errors.any?
        flash[:error] = resource.errors.full_messages.to_sentence
      end
    end
  end
end
