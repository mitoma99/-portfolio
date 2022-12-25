class Public::CustomersController < ApplicationController
  before_action :ensure_guest_customer, only: [:edit]

  def show
    @customer = Customer.find(params[:id])
    @tweets = @customer.tweets.order(created_at: :desc)
  end

  def babyfoods
    @customer = Customer.find(params[:customer_id])
    @babyfoods = @customer.babyfoods.order(created_at: :desc)
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    @customer=Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :nickname, :introduction, :email, :image)
  end

  def ensure_guest_customer
    @customer = Customer.find(params[:id])
    if @customer.name == "gestcustomer"
      redirect_to customer_path(current_customer) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
