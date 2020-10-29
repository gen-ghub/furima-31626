class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.includes(:user).order('created_at DESC')
    @delivery = ['--', '着払い（購入者負担）', '送料込み（出品者負担）']
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :delivery_id, :day_id, :price, :area_id, :status_id, :tag_id).merge(user_id: current_user.id)
  end
end
