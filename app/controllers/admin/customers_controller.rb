class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    #会員詳細画面のつぶやきを新しい順に表示するため
    @tweets = @customer.tweets.order(created_at: :desc).page(params[:page]).per(4)
  end

  def babyfoods
    @customer = Customer.find(params[:customer_id])
    #会員詳細画面の離乳食を新しい順に表示するため
    @babyfoods = @customer.babyfoods.order(created_at: :desc).page(params[:page]).per(7)
  end

  def index
    @customers=Customer.all.page(params[:page]).per(10)
  end
end
