# coding: UTF-8
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index

    if check_rights(admin_user?)
      @users = User.all
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    check_rights(@user == current_user || admin_user?)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    check_rights(@user == current_user || admin_user?)
  end


  def create
    @user = User.new(user_params)
    @user.role=100
    if @user.save
      flash[:notice] = "Danke für die Anmeldung!"
      redirect_to @user
    else
      render 'new'
    end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if check_rights(@user == current_user || admin_user?)
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
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if check_rights(admin_user?)
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :role, :deleted_at)
    end
end
