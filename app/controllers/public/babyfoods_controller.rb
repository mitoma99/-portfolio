class Public::BabyfoodsController < ApplicationController
  def new
    @babyfood=Babyfood.new
  end

  def create
    @babyfood=Babyfood.new(babyfood_params)
    @babyfood.customer_id=current_customer.id
    if @babyfood.save
      redirect_to babyfoods_path
    else
      render :new
    end
  end

  def show
    @babyfood=Babyfood.find(params[:id])
  end

  def index
    @tags=Tag.all
    @babyfoods = Babyfood.all
    @q = Babyfood.ransack(params[:q])
    #検索にTagのnameが入ってないか
    if params[:name].present?
      @babyfoods = Tag.find(params[:name]).babyfoods
    else
    #入っていなかったらキーワード検索をする
      @babyfoods = @q.result(distinct: true).order("created_at desc")
    #if文でタグ検索とキーワード検索を使い分けている
    end
  end

  def edit
    @babyfood=Babyfood.find(params[:id])
  end

  def update
    @babyfood=Babyfood.find(params[:id])
    @babyfood.customer_id=current_customer.id
    if @babyfood.update(babyfood_params)
      redirect_to babyfood_path(@babyfood.id)
    else
      render :edit
    end
  end

  def destroy
    @babyfood=Babyfood.find(params[:id])
    @babyfood.destroy
    redirect_to babyfoods_path
  end


  private

  def babyfood_params
    params.require(:babyfood).permit(:title, :food, :point, :making, :image, :tag_id)
  end
end
