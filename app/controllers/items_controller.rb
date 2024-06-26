class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_not_edit, only: [:edit]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path, notice: 'Item was successfully deleted.'
    else
      redirect_to item_path(@item), alert: 'You are not authorized to delete this item.'
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, :item_condition_id, :shipping_cost_id,
                                 :prefecture_id, :delivery_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    return unless current_user.id != @item.user_id

    redirect_to action: :index
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_not_edit
    @item = Item.find(params[:id])
    return if @item.order.nil?

    redirect_to items_path
  end
end
