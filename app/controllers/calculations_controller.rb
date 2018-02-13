class CalculationsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :user_id_not_found

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

    # Get user ID's allowed_products.
    user = User.find(params[:calculation][:user_id])
    allowed_products = user.allowed_products.split(", ")

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
      flash[:notice] = "Calculation was successful."
      redirect_to @calculation
    else
      render 'new'
    end
  end

  def destroy
    @calculation = Calculation.find(params[:id])
    @calculation.destroy

    flash[:notice] = "Calculation was successfully destroyed."
    redirect_to calculations_path
  end

  private
    def calculation_params
      params.require(:calculation).permit(:amount, :list, :user_id)
    end

    def user_id_not_found
      flash[:alert] = "User ID not found. Please find the correct ID from the list below."
      redirect_to users_path
    end
end
