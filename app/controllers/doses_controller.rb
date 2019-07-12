class DosesController < ApplicationController
  def new
    # @cocktail = Cocktail.find(params[:cocktail_id])
    # redirect_to cocktail_path(@cocktail)
  end

  def create
    @dose = Dose.new(params_dose)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def params_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
