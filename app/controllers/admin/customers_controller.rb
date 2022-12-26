class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @tweets = @customer.tweets.order(created_at: :desc).page(params[:page]).per(4)
  end

  def babyfoods
    @customer = Customer.find(params[:customer_id])
    @babyfoods = @customer.babyfoods.order(created_at: :desc).page(params[:page]).per(7)
  end

  def index
    @customers=Customer.all.page(params[:page]).per(10)
  end
end
