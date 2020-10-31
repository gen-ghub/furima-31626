class ShoppingsController < ApplicationController

  def index
    @shopping = Shopping.new
  end

  def create
    @shopping =Shopping.new(shopping_params)
    if @shopping.valid?
      @shopping.save
      redirect_to root_path
    else
      render action: :index
    end
  end


  private

  def shopping_params
    params.permit(:user_id, :item_id, :postal_code, :area_id, :town, :town_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end
