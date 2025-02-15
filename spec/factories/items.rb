FactoryBot.define do
  factory :item do
    association :user
    item_name                    {"サンプル"}
    item_info                    {"サンプルの説明文"}
    item_category_id             {2}
    item_sales_status_id         {2}
    item_shipping_fee_status_id  {2}
    prefecture_id                {2}
    item_scheduled_delivery_id   {2}
    sell_price                   {2000}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
