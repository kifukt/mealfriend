class IntakesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_intake, only: [:show, :edit, :update, :destroy]
  before_action :require_token, only: [:create, :index]
  swagger_controller :intakes, 'Intakes'


  # GET /intakes
  # GET /intakes.json
  swagger_api :index do
    summary 'Returns intakes of current user'
    param :header, "Authorization", :string, :required, "Authentication token"
  end
  def index
    @intakes = Intake.all
    # user = User.find_by(id: session[:user_id])
    # @intakes = user.intake.all
  end

  # GET /intakes/1
  # GET /intakes/1.json
  swagger_api :show do
    summary 'Returns one intake'
    param :path, :id, :integer, :required, "Intake id"
    notes 'Notes...'
  end
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
    param :form, "intake[amount]", :float, :required, "Amount of an intake"
    param :form, "intake[user_id]", :float, :required, "User id"
    param :form, "intake[ingredient_id]", :float, :required, "ingredients id"
  end
  def create
    # @ingredient = Ingredient.find(params[:ingredient_id])
    @intake = Intake.new(intake_params)
    puts @intake.inspect
    # @intake.user = current_user
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
  swagger_api :update do
    summary "Update an intake"
    param :form, "intake_id", :integer, :required, "ingredient id"
    param :form, "intake[amount]", :float, :optional, "Amount of an intake"
  end
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
  swagger_api :destroy do
    summary 'Destroys an intake'
    param :path, :id, :integer, :required, "Intake id"
    notes 'Notes...'
  end
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
