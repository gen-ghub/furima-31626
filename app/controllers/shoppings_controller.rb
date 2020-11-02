class ShoppingsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :id_item, only:[:index, :create]
  before_action :sold_aut, only:[:index, :create]
  def index
    @shopping = Shopping.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @shopping = Shopping.new(shopping_params)
    if @shopping.valid?
      pay_item
      @shopping.save
      redirect_to root_path
    else
      id_item
      render action: :index
    end
  end

  private
  def id_item
    @item = Item.find(params[:item_id])
  end

  def sold_aut
    if @item.price_record
      redirect_to root_path
    end
  end

  def shopping_params
    params.require(:shopping).permit(:postal_code, :area_id, :town, :town_number, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    id_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: shopping_params[:token],
      currency: 'jpy'
    )
  end
end
