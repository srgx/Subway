class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
    @account = current_user.account
  end

  def update
    @account = current_user.account
    if(@account.update(account_params))
      redirect_to account_path
    else
      render 'edit'
    end
  end

  private
    def account_params
      params.require(:account).permit(:name)
    end
end
