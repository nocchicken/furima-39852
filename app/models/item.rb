class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :status
  belongs_to :brand

  with_options presence: true do
    validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :status_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :brand_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :name
    validates :price, numericality:{only_integer:true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999}
    validates :explanation
    validates :image
  end
end
