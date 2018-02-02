class ProductsController < ApplicationController
  def new
  end

  def create
    render plain: params[:product].inspect
  end
end
