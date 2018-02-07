class DiariesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  before_action :require_token, only: [:create, :index]
  swagger_controller :diaries, 'Diaries'

  # GET /diaries
  # GET /diaries.json
  swagger_api :index do
    summary 'Returns diaries of certain user'
    param :header, "Authorization", :string, :required, "Authentication token"
    notes 'Notes...'
  end
  def index
    @diaries = Diary.all
  end

  # GET /diaries/
  # GET /diaries/1.json
  swagger_api :show do
    summary 'Returns one diary for authenticatted user'
    param :path, :id, :integer, :required, "Diary id"
    notes 'Notes...'
  end
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
    param :form, :user_id, :integer, :required, "User id"
    param :form, "diary[weight]", :float, :required, "Weight of a diary"
  end
  def create
    @user = User.find(params[:user_id])
    @diary = @user.diaries.new(diary_params)
    @diary.user = current_user


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
  swagger_api :update do
    summary "Update a diary"
    param :path, :id, :integer, :required, "Diary id"
    param :path, :user_id, :integer, :required, "user id"
    param :form, "diary[weight]", :float, :required, "Weight of a diary"
  end
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
  swagger_api :destroy do |diary|
    summary 'Destroys a diary'
    param :path, :id, :integer, :required, "Post id"
    param :path, :user_id, :integer, :required, "Topic id"
    param :path, :weight, :float, :required, "Weight of a diary"
    notes 'Notes...'
  end
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
