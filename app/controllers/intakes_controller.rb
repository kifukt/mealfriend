class IntakesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_intake, only: [:show, :edit, :update, :destroy]
  before_action :require_token, only: [:create]
  swagger_controller :intakes, 'Intakes'


  # GET /intakes
  # GET /intakes.json
  swagger_api :index do
    summary 'Returns all intakes'
    notes 'Notes...'
  end
  def index
    @intakes = Intake.all
  end

  # GET /intakes/1
  # GET /intakes/1.json
  def show
  end

  # GET /intakes/new
  def new
    @intake = Intake.new
  end

  # GET /intakes/1/edit
  def edit
  end

  # POST /intakes
  # POST /intakes.json
  swagger_api :create do
    summary "Create new intake"
    param :header, "Authorization", :string, :required, "Authentication token"
    param :form, "ingredient_id", :integer, :required, "ingredient id"
    param :form, "intake[amount]", :float, :required, "Amount of an intake"
   end
  def create
    @ingredient = Ingredient.find(params[:ingredient_id])
    @intake = @ingredient.intake.new(intake_params)
    @intake.user = current_user

    respond_to do |format|
      if @intake.save
        format.html { redirect_to @intake, notice: 'Intake was successfully created.' }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @intake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intakes/1
  # PATCH/PUT /intakes/1.json
  def update
    respond_to do |format|
      if @intake.update(intake_params)
        format.html { redirect_to @intake, notice: 'Intake was successfully updated.' }
        format.json { render :show, status: :ok, location: @intake }
      else
        format.html { render :edit }
        format.json { render json: @intake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intakes/1
  # DELETE /intakes/1.json
  def destroy
    @intake.destroy
    respond_to do |format|
      format.html { redirect_to intakes_url, notice: 'Intake was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intake
      @intake = Intake.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def intake_params
      params.require(:intake).permit(:user_id, :ingredient_id, :amount)
    end
end
