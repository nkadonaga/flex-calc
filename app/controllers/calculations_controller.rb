class CalculationsController < ApplicationController
  def index
    @calculations = Calculation.all
  end

  def show
    @calculation = Calculation.find(params[:id])
  end

  def new
    @calculation = Calculation.new
  end

  def create
    amount_left = params[:calculation][:amount].to_f

    # Order products by ascending price.
    products = Product.order(:price)
    cheapest_product = products[0]

    # Create shopping list.
    product_array = []
    while (amount_left - cheapest_product.price) >= 0
      product_array.push(cheapest_product.name)
      amount_left -= cheapest_product.price
    end

    # Add shopping list to record
    attributes = calculation_params.clone
    attributes[:list] = product_array.join(", ")
    @calculation = Calculation.new(attributes)

    if @calculation.save
      redirect_to @calculation
    else
      render 'new'
    end
  end

  def destroy
    @calculation = Calculation.find(params[:id])
    @calculation.destroy

    redirect_to calculations_path
  end

  private
    def calculation_params
      params.require(:calculation).permit(:amount, :list)
    end
end
