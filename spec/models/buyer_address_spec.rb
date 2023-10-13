require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '購入情報登録' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id, item_id: item.id)
    end

    context '購入できるとき' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@buyer_address).to be_valid
      end
      it 'building_nameは空でも購入できる' do
        @buyer_address.building_name = ''
        expect(@buyer_address).to be_valid
      end
    end
    context '購入できないとき' do
      it 'tokenが空だと購入できない' do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと購入できない' do
        @buyer_address.post_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが3桁ハイフン4桁形式でないと購入できない' do
        @buyer_address.post_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idを選択していないと購入できない' do
        @buyer_address.prefecture_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("Prefecture can't be blank")
      end
      it 'prefecture_idに「---」が選択されている場合は購入できない' do
        @buyer_address.prefecture_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("Prefecture can't be blank")
      end
      it 'cityが空だと購入できない' do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できない' do
        @buyer_address.address = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @buyer_address.phone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角文字では購入できない' do
        @buyer_address.phone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが10桁以下では購入できない' do
        @buyer_address.phone_number = '123456789'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上では購入できない' do
        @buyer_address.phone_number = '000123456789'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberに数字以外が含まれていると購入できない' do
        @buyer_address.phone_number = 'あ'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'userが紐付いていないと購入できない' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できない' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end









