class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @tweets = @customer.tweets.order(created_at: :desc)
  end

  def babyfoods
    @customer = Customer.find(params[:customer_id])
    @babyfoods = @customer.babyfoods.order(created_at: :desc)
  end

  def index
    @customers=Customer.all
  end
end
