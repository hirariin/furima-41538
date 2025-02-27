FactoryBot.define do
  factory :order_form do
    user_id { 1 }
    item_id { 1 }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '横浜市' }
    addresses { '港北区1-1-1' }
    building { '横浜タワー' }
    phone_number { '09012345678' }
  end
end
