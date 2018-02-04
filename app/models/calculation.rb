class Calculation < ApplicationRecord
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :list, length: { minimum: 1, message: "of products is empty because amount is not enough to buy anything" } 
end
