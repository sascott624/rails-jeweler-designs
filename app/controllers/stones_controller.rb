class StonesController < ApplicationController

  def index
    @stones = Stone.all
    @expensive = Stone.most_expensive
    @cheap = Stone.least_expensive
  end

  def create
    @stone = Stone.new(stone_params)
    if @stone.save
      redirect_to stone_path(@stone)
    else
      render :new
    end
  end

  def new
    @stone = Stone.new
  end

  def show
    @stone = Stone.find(params[:id])
  end

  def update
    @stone.update(stone_params)
    if @stone.save
      redirect_to stone_path(@stone)
    else
      render :edit
    end
  end

  def destroy
    @stone = Stone.find(params[:id])
    @stone.destroy
    redirect_to stones_path
  end

  def edit
    @stone = Stone.find(params[:id])
  end

  private

  def stone_params
    params.require(:stone).permit(:name, :weight, :cost, designs_attributes: [:metal, :model, :user_id, :stone_id])
  end

end
