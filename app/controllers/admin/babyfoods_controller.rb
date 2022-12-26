class Admin::BabyfoodsController < ApplicationController
  def show
    @babyfood=Babyfood.find(params[:id])
  end

  def index
    @tags=Tag.all
    @babyfoods = Babyfood.all
    @q = Babyfood.ransack(params[:q])
    #検索にTagのnameが入ってないか
    if params[:name].present?
      @babyfoods = Tag.find(params[:name]).babyfoods.order("created_at desc").page(params[:page]).per(5)
    else
    #入っていなかったらキーワード検索をする
      @babyfoods = @q.result(distinct: true).order("created_at desc").page(params[:page]).per(5)
    #if文でタグ検索とキーワード検索を使い分けている
    end
  end

  def destroy
    @babyfood=Babyfood.find(params[:id])
    @babyfood.destroy
    redirect_to admin_babyfoods_path
  end
end
