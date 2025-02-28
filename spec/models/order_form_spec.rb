require 'rails_helper'

RSpec.describe OrderForm, type: :model do

  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
    sleep(1)
  end
  describe '配送先情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_form.prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空だと保存できないこと' do
        @order_form.addresses = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以上11桁以内の半角数字でない場合、保存できないこと' do
        @order_form.phone_number = '090123456'
        expect(@order_form).not_to be_valid
        expect(@order_form.errors.full_messages).to include('Phone number is invalid. Must be 10 to 11 digits long and contain only numbers')
        
        @order_form.phone_number = '090123456789'
        expect(@order_form).not_to be_valid
        expect(@order_form.errors.full_messages).to include('Phone number is invalid. Must be 10 to 11 digits long and contain only numbers')
        
        @order_form.phone_number = '090-1234-5678'
        expect(@order_form).not_to be_valid
        expect(@order_form.errors.full_messages).to include('Phone number is invalid. Must be 10 to 11 digits long and contain only numbers')
        
        @order_form.phone_number = '090abcd5678'
        expect(@order_form).not_to be_valid
        expect(@order_form.errors.full_messages).to include('Phone number is invalid. Must be 10 to 11 digits long and contain only numbers')
      end
      it "tokenが空では登録できないこと" do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと保存できないこと' do
        @order_form.user_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @order_form.item_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
