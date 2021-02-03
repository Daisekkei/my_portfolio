class CustomersController < ApplicationController
  
  def index
    @customers = Customer.all
  end

  def create
    Customer.create(customer_params)
    redirect_to controller: 'posts', action: 'index' 
    flash[:notice] = '顧客登録しました'
  end

  def new
    @customers = Customer.all
    @customer = Customer.new

  end


  private
  def customer_params
    params.require(:customer).permit(:customer_name)
  end





end