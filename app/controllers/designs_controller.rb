class DesignsController < ApplicationController

  def index
    @designs = Design.all
  end

  def create
    raise params.inspect
    @design = Design.new(design_params)
    if @design.save
      redirect_to design_path(@design)
    else
      render :new
    end
  end

  def new
    @design = Design.new
  end

  def show
    @design = Design.find(params[:id])
  end

  def update
    @design.update(design_params)
    if @design.save
      redirect_to design_path(@design)
    else
      render :edit
    end
  end

  def destroy
    @design = Design.find(params[:id])
    @design.destroy
    redirect_to designs_path
  end

  def edit
    @design = Design.find(params[:id])
  end

  private

  def design_params
    params.require(:design).permit(:user_id, :stone_id, :metal, :model)
  end

end
