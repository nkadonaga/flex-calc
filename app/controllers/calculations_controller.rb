class CalculationsController < ApplicationController
  def new
    # @calculation = Calculation.new
  end

  # def create
  #   @amount = Calculation.new(calculation_params)
  #   # Order products by ascending price.
  #   products = Product.order(:price)
  #   cheapest_product = products[0]
  #   @list = []
  #   amount_left = @amount
  #   while amount_left - cheapest_product.price >= 0
  #     @list.puts(cheapest_product)
  #   end
  # end

  private
    def calculation_params
      params.require(:calculation).permit(:amount)
    end
end
