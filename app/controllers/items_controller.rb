class ItemsController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

private

def item_params
  params.require(:item).permit(:product_name, :product_description, :category_id, :item_condition_id, :shipping_cost_id, :prefecture_id, :delivery_time_id, :price, :image).merge(user_id: current_user.id)
end

end