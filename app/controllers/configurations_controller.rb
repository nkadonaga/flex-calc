class ConfigurationsController < ApplicationController
  # TODO use checkboxes to change which items are allowed.
  def index
    # @calculations = Calculation.all
  end
  
  def new
    @configuration = Configuration.new
    @products = Product.all
  end

  def create
  end
end