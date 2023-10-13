FactoryBot.define do
  factory :buyer_address do
    post_code               { '123-4567'}
    prefecture_id          { Faker::Number.between(from: 2, to: 48) }
    city { '北海道'}
    address { '1-1' }
    building_name { '札幌ハイツ'}
    phone_number { '00123456789' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end