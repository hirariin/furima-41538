class Item < ApplicationRecord
   belongs_to :user
   has_one_attached :image

   extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :item_category
   belongs_to :item_sales_status
   belongs_to :item_shipping_fee_status
   belongs_to :prefecture
   belongs_to :item_scheduled_delivery

   validates :item_name, :item_info, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id,
             :prefecture_id, :item_scheduled_delivery_id, :sell_price, presence: true

   validates :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :prefecture_id,
             :item_scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
