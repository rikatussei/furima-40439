require 'rails_helper'

RSpec.describe OrderDeliveryAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @order_delivery_address = FactoryBot.build(:order_delivery_address, user_id: @user.id, item_id: @item.id)
  end

  describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_delivery_address).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_delivery_address.building_name = ''
        expect(@order_delivery_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '購入者情報がない場合は購入できないこと' do
        @order_delivery_address.user_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("User can't be blank")
      end

      it '商品情報がない場合は購入できないこと' do
        @order_delivery_address.item_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'postal_codeが空だと保存できないこと' do
        @order_delivery_address.postal_code = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Postal code can't be blank",
                                                                        'Postal code is invalid. Include hyphen(-)')
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_delivery_address.postal_code = '1234567'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idを選択していないと保存できないこと' do
        @order_delivery_address.prefecture_id = 1
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @order_delivery_address.city = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("City can't be blank")
      end

      it 'street_addressが空だと保存できないこと' do
        @order_delivery_address.street_address = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Street address can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @order_delivery_address.phone_number = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが12桁以上の半角数値では保存できないこと' do
        @order_delivery_address.phone_number = '012345678912'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number is too long")
      end

      it 'phone_numberが9桁以内の半角数値では保存できないこと' do
        @order_delivery_address.phone_number = '012012'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Phone number is too short')
      end

      it 'phone_numberに半角数値以外を使用すると保存できないこと' do
        @order_delivery_address.phone_number = '120-123-123'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end

      it 'tokenが空では登録できないこと' do
        @order_delivery_address.token = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
