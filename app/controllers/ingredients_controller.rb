class IngredientsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  #before_action :require_token, only: [:create]
  swagger_controller :ingredients, 'Ingredients'

  # GET /ingredients
  # GET /ingredients.json
  swagger_api :index do
    summary 'Returns all ingredients'
    notes 'Notes...'
  end
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  swagger_api :show do
    summary 'Returns one ingredient'
    param :path, :id, :integer, :required, "Ingredient id"
    notes 'Notes...'
  end
  def show
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  # POST /ingredients.json
  swagger_api :create do
    summary "Create new ingredient"
    #param :header, "Authorization", :string, :required, "Authentication token"
    param :form, "ingredient[name]", :string, :required, "Title of an ingredient"
    param :form, "ingredient[calories]", :float, :required, "Calories amount"
    param :form, "ingredient[proteins]", :float, :required, "Proteins amount"
    param :form, "ingredient[carbohydrates]", :float, :required, "Carbohydrates amount"
    param :form, "ingredient[fats]", :float, :required, "Fats amount"
  end
  def create
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  swagger_api :update do
    summary "Upgrade an ingredient"
    param :path, :id, :integer, :required, "Ingredients id"
    param :form, "ingredient[name]", :string, :required, "Title of an ingredient"
    param :form, "ingredient[calories]", :float, :optional, "Calories amount"
    param :form, "ingredient[proteins]", :float, :optional, "Proteins amount"
    param :form, "ingredient[carbohydrates]", :float, :optional, "Carbohydrates amount"
    param :form, "ingredient[fats]", :float, :optional, "Fats amount"
  end
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  swagger_api :destroy do
    summary 'Destroys an ingredient'
    param :path, :id, :integer, :required, "Ingredient id"
    notes 'Notes...'
  end
  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to ingredients_url, notice: 'Ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :calories, :carbohydrates, :fats, :proteins)
    end
end
