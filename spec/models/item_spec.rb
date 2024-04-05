require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '出品ができる場合' do
      it "imageとproduct_name、product_descriptionとcategory_id,item_condition_idとshipping_cost_id、prefecture_idとdelivery_time_id、priceが存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context '出品ができない場合' do
      it "ユーザー情報がない場合は登録できないこと" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it "imageが空では出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "product_nameが空では出品できない" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it "product_descriptionが空では出品できない" do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end

      it "category_idが空では出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "item_condition_idが空では出品できない" do
        @item.item_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end

      it "shipping_cost_idが空では出品できない" do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it "prefecture_idが空では出品できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
  
      it "delivery_time_idが空では出品できない" do
        @item.delivery_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end

      it "priceが空では出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number", "Price can't be blank")
      end

      it "priceが300円以下では出品できない" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceが9999999円以上では出品できない" do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "priceが半角の数値以外では出品できない" do
        @item.price = "akd"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceに小数点があると出品できない" do
        @item.price = 0.1
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be an integer")
      end
    end
  end
end