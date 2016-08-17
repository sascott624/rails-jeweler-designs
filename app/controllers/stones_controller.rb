class StonesController < ApplicationController

  def index
    if params[:user_id]
      @stones = User.find(params[:user_id]).stones.uniq
      @expensive = Stone.most_expensive
      @cheap = Stone.least_expensive
    else
      @stones = Stone.all
      render json: @stones
    end

  end

  def create
    @stone = Stone.new(stone_params)
    if @stone.save
      redirect_to stone_path(@stone)
    else
      @stone.errors.add(:incomplete_form, "Stones must have a valid name, weight, and cost.")
      render :new
    end
  end

  def new
    @stone = Stone.new
  end

  def show
    stone_find
  end

  def update
    @stone.update(stone_params)
    if @stone.save
      redirect_to stone_path(@stone)
    else
      @stone.errors.add(:incomplete_form, "Stones must have a valid name, weight, and cost.")
      render :edit
    end
  end

  def destroy
    stone_find
    @stone.destroy
    redirect_to stones_path
  end

  def edit
    stone_find
  end

  private

  def stone_params
    params.require(:stone).permit(:name, :weight, :cost, designs_attributes: [:metal, :model, :user_id, :stone_id])
  end

  def stone_find
    @stone = Stone.find(params[:id])
  end

end
