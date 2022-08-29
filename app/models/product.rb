class Product < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :unit
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0 }
    #in: [true, false]を設定する
    validates :availability, inclusion: { in: [true, false] }
   end
end
