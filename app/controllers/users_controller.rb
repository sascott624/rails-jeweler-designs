class UsersController < ApplicationController

  before_action :find_user, only: [:show, :update]
  before_action :validate_user, only: [:edit, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to welcome_path
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @stones = @user.stones.uniq
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to welcome_path
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :location)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def validate_user
    find_user
    if @user != current_user
      flash[:error] = "You do not have permission to edit or destroy another user's profile"
      redirect_to users_path
    end
  end


end
