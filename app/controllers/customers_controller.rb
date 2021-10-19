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
        redirect_to '/customers'
    end

  private
    def customer_params
        customer_params = params.permit(:name, :age, :account_active)
        customer_params[:age] = customer_params[:cost].to_i
        if customer_params[:account_active] == 'yes'
            customer_params[:account_active] = true
        else
            customer_params[:account_active] = false
        end
        customer_params
    end
end
