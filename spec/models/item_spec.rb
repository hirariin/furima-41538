require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it 'すべての項目が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end
    
    context '出品できない場合' do
      it 'imageが空では出品できない' do
        @item.image=nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では出品できない' do
        @item.item_name=''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_infoが空では出品できない' do
        @item.item_info=''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it 'item_categoryが空では出品できない' do
        @item.item_category_id=''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item_sales_statusが空では出品できない' do
        @item.item_sales_status_id=''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end
      it 'item_shipping_fee_statusが空では出品できない' do
        @item.item_shipping_fee_status_id=''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end
      it 'prefectureが空では出品できない' do
        @item.prefecture_id=''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'item_scheduled_deliveryが空では出品できない' do
        @item.item_scheduled_delivery_id=''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end
      it 'sell_priceが空では出品できない' do
        @item.sell_price=''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sell price can't be blank")
      end
      it 'sell_price が300未満だと出品できない' do
        @item.sell_price = 299
        @item.valid?
      end
      it 'sell_price が9,999,999を超えると出品できない' do
        @item.sell_price = 10_000_000
        @item.valid?
      end
      it '価格が全角数字だと保存できない' do
        @item.sell_price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Sell price is not a number')
      end
    end
  end
end
