class Public::CustomersController < ApplicationController
  before_action :ensure_guest_customer, only: [:edit]

  def show
    @customer = Customer.find(params[:id])
    #会員の詳細画面につぶやきを新しい順に表示するため
    @tweets = @customer.tweets.order(created_at: :desc).page(params[:page]).per(4)
  end
  
  #会員詳細画面を２ページに分けるため
  def babyfoods
    @customer = Customer.find(params[:customer_id])
    #会員詳細画面に離乳食のレシピを新しい順に表示するため
    @babyfoods = @customer.babyfoods.order(created_at: :desc).page(params[:page]).per(7)
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
  
  #ゲストユーザーのため
  def ensure_guest_customer
    @customer = Customer.find(params[:id])
    if @customer.name == "gestcustomer"
      redirect_to customer_path(current_customer) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
