class CustomerAccountsController < ApplicationController
  def index
    @customer = Customer.find(params[:id])
  end
end
