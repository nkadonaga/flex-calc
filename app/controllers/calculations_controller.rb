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
    cheapest_product = products.first

    # Get most recent preference setting.
    preferences = Preference.order(created_at: :desc)
    allowed_products = preferences.first.allowed_products.split(", ")

    # Create shopping list.
    shopping_list = []
    while (amount_left - cheapest_product.price) >= 0
      if allowed_products.include?(cheapest_product.id.to_s)
        shopping_list.push(cheapest_product.name)
        amount_left -= cheapest_product.price
      elsif products.length > 1
        puts cheapest_product.name
        products = products.drop(1)
        cheapest_product = products.first
      else 
        break
      end
    end

    # Add shopping list to record
    attributes = calculation_params.clone
    attributes[:list] = shopping_list.join(", ")
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
