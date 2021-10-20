class AccountsController < ApplicationController
  def index
    @accounts = Account.all

  end

  def show
    @account = Account.find(params[:id])
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    account = Account.find(params[:id])
    account.update(account_params)
    redirect_to "/accounts/#{account.id}"
  end

  def destroy
    Account.destroy(params[:id])
    redirect_to "/accounts"
  end

  private
    def account_params
      account_params = params.permit(:acct_name, :dollar_amount, :has_money)
      account_params[:has_money] = account_params[:has_money] == 'yes'
      account_params
    end
end
