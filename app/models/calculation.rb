class Calculation < ApplicationRecord
  belongs_to :user
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :list, length: { minimum: 1, message: "of products is empty because amount is not enough to buy any of the preferred items" } 
  validates :user_id, presence: true
end
