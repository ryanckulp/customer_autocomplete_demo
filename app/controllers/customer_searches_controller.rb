class CustomerSearchesController < ApplicationController

  def new
    customers = Customer.search(params)
    render json: { customers: customers }
  end

end
