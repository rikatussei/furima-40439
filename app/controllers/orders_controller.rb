class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_items_index, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_delivery_address = OrderDeliveryAddress.new
  end

  def create
    @order_delivery_address = OrderDeliveryAddress.new(order_params)
    if @order_delivery_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
        card: order_params[:token], # カードトークン
        currency: 'jpy' # 通貨の種類（日本円）
      )
      @order_delivery_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_delivery_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def move_to_items_index
    @item = Item.find(params[:item_id])
    return unless current_user.id == @item.user_id || !@item.order.nil?

    redirect_to items_index_path
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
