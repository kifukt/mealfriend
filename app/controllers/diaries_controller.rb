class DiariesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  before_action :require_token, only: [:create]
  swagger_controller :diaries, 'Diaries'

  # GET /diaries
  # GET /diaries.json
  swagger_api :index do
    summary 'Returns all diaries'
    notes 'Notes...'
  end
  def index
    @diaries = Diary.all
  end

  # GET /diaries/1
  # GET /diaries/1.json
  def show
  end

  # GET /diaries/new
  def new
    @diary = Diary.new
  end

  # GET /diaries/1/edit
  def edit
  end

  # POST /diaries
  # POST /diaries.json
  swagger_api :create do
    summary "Create new diary"
    param :header, "Authorization", :string, :required, "Authentication token"
    param :path, :user_id, :integer, :required, "User id"
    param :form, "diary[weight]", :float, :required, "Weight of a diary"
  end
  def create
    @user = User.find(params[:login])
    @diary = @user.diary.new(diary_params)


    respond_to do |format|
      if @diary.save
        format.html { redirect_to @diary, notice: 'Diary was successfully created.' }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diaries/1
  # PATCH/PUT /diaries/1.json
  def update
    respond_to do |format|
      if @diary.update(diary_params)
        format.html { redirect_to @diary, notice: 'Diary was successfully updated.' }
        format.json { render :show, status: :ok, location: @diary }
      else
        format.html { render :edit }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diaries/1
  # DELETE /diaries/1.json
  def destroy
    @diary.destroy
    respond_to do |format|
      format.html { redirect_to diaries_url, notice: 'Diary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diary
      @diary = Diary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diary_params
      params.require(:diary).permit(:user_id, :weight)
    end
end
