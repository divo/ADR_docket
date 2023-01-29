class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :authorize, only: %i[new create]

  # GET /users
  def index
    head 401
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        send_analytics("user_created", @user)
        format.html { redirect_to dockets_url, notice: "#{@user.email} was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_url, notice: "User was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  def destroy
    send_analytics("user_deleted", @user)

    @user.dockets.each { |doc| doc.destroy }
    @user.destroy
    session[:user_id] = nil

    respond_to do |format|
      format.html { redirect_to root_path, notice: "User was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :company_name, :tagline, :address, :phone, :email)
    end
end
