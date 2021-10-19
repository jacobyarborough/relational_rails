class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
  end

  def create
        Customer.create(customer_params)
        require "pry"; binding.pry
        redirect_to '/customers'
    end

  private
    def customer_params
        customer_params = params.permit(:name, :age, :active_account)
        if customer_params[:account_status] == 'yes'

            customer_params[:active_account] = true
        else
            customer_params[:active_account] = false
        end
        customer_params
    end
end
