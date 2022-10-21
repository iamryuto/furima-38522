require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '購入できる場合' do
      it 'token, zip, prefecture_id, city, address, building, phone_numberが存在すれ購入できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingが空で購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context '購入できない場合' do
      it 'tokenが空で購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'zipが空で購入できない' do
        @order_address.zip = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip can't be blank")
      end
      it 'cityが空で購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空で購入できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空で購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid. Input only number")
      end
      it 'prefecture_idが空(id: 1, name: "---")で購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'zipがハイフンなしでは保存できない' do
        @order_address.zip = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'zipが7桁未満では保存できない' do
        @order_address.zip = '123-456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'zipが7桁を超えると保存できない' do
        @order_address.zip = '123-45678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'zipが7桁でも4桁-3桁では保存できない' do
        @order_address.zip = '1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'zipが全角では保存できない' do
        @order_address.zip = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'phone_numberが10桁未満では保存できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberが11桁を超えると保存できない' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberが全角だと保存できない' do
        @order_address.phone_number = '１２３４５６７８９０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberが数値以外だと保存できない' do
        @order_address.phone_number = 'aaaaaaaaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
    end
  end
end
