class CustomerAccountsController < ApplicationController
  def index
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.find(params[:id])
  end

  def create
    customer = Customer.find(params[:id])
    customer.accounts.create(account_params)
    redirect_to "/customers/#{customer.id}/accounts"
  end

  private
    def account_params
      account_params = params.permit(:acct_name, :has_money, :dollar_amount )
      account_params[:dollar_amount] = account_params[:dollar_amount]
      account_params[:has_money] = params[:has_money] == 'yes'
      account_params
    end
end
