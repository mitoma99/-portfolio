class Public::BabyfoodsController < ApplicationController
  def new
    @babyfood=Babyfood.new
  end

  def create
    @babyfood=Babyfood.new(babyfood_params)
    @babyfood.customer_id=current_customer.id
    @babyfood.save
    redirect_to babyfoods_path
  end

  def show
    @babyfood=Babyfood.find(params[:id])
  end

  def index
    @babyfoods=Babyfood.all
  end

  def edit
  end

  private

  def babyfood_params
    params.require(:babyfood).permit(:title, :food, :point, :making, :image, :tag_id)
  end
end
