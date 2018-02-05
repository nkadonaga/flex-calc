class PreferencesController < ApplicationController
  def index
    @preferences = Preference.all
  end

  def show
    @preference = Preference.find(params[:id])
  end

  def new
    @preference = Preference.new
  end

  def create
    product_array = params[:preference][:allowed_products]

    attributes = preference_params.clone
    attributes[:allowed_products] = product_array.drop(1).join(", ")
    @preference = Preference.new(attributes)

    if @preference.save
      redirect_to @preference
    else
      render 'new'
    end
  end

  def destroy
    @preference = Preference.find(params[:id])
    @preference.destroy

    redirect_to preferences_path
  end

  private
    def preference_params
      params.required(:preference).permit(:allowed_products)
    end
end
