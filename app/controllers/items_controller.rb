class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
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

  def show
    @record = PriceRecord.new
  end

  def edit
    unless @item.user.id == current_user.id
    redirect_to root_path
    end
    if @item.price_record
      redirect_to root_path
    end
  end

  def destroy
    unless @item.user.id == current_user.id
      redirect_to root_path
    end
    if @item.destroy
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :delivery_id, :day_id, :price, :area_id, :status_id, :tag_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
