class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  swagger_controller :users, 'Users'
  # GET /users
  # GET /users.json
  swagger_api :index do
    summary 'Returns all users'
    notes 'Notes...'
  end
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  swagger_api :show do
    summary 'Returns one user'
    param :path, :id, :integer, :required, "Users id"
    notes 'Notes...'
  end
  def show
  end

  # GET /users/new
  swagger_api :create do
    summary "Create a user"
    param :form, "user[login]", :string, :required, "Users login"
    param :form, "user[password]", :string, :required, "Users password"
  end
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:login, :password, :password_confirmation, :birthdate, :height, :sex)
    end
  
end
