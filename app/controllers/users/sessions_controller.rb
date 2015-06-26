class Users::SessionsController < Devise::SessionsController
  def create
    super do |resource|
      if resource.errors.any?
        flash[:error] = resource.errors.full_messages.to_sentence
      end
    end
  end
end
