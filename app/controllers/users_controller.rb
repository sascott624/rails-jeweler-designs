class UsersController < ApplicationController

  def index
    @users = User.all
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
    find_user
    @stones = @user.stones.uniq
  end

  def update
    find_user
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    find_user
    @user.destroy
    redirect_to welcome_path
  end

  def edit
    find_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :location)
  end

  def find_user
    @user = User.find(params[:id])
  end


end
