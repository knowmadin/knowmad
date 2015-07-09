class AccountsController < ApplicationController
  def create
    if account.save
      current_identity.account = account
      current_identity.save!
      redirect_to controller: '/home', action: 'index'
    else
      flash[:error] = account.errors.full_messages.to_sentence
      render 'account/new'
    end
  end

  private

  def account
    @account ||= Account.new(subdomain: params[:account][:subdomain])
  end
end
