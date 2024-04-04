class ItemsController < ApplicationController

  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
private

def item_params
  params.require(:item).permit(:product_name, :product_description, :category_id, :item_condition_id, :shipping_cost_id, :prefecture_id, :delivery_time_id, :price, :image).merge(user_id: current_user.id)
end

end