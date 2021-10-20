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

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to "/customers/#{customer.id}"
  end

  private
    def customer_params
        customer_params = params.permit(:name, :age, :active_account)
        customer_params[:active_account] = customer_params[:active_account] == 'yes'
        customer_params
    end
end
