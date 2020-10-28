class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @itme = Item.create(item_params)
    if @itme.save
      redirect_to root_path
    else
      render :new
    end
  end

    private

    def item_params
      params. require(:itme).permit(:image, :name, :description, :delivery_id, :day_id, :price, :area_id, :status_id, :tag_id).merge(user_id: current_user.id)

    end

end
