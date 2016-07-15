class DesignsController < ApplicationController

  def index
    if params[:user_id]
      @designs = User.find(params[:user_id]).designs
    else
      @designs = Design.all
    end
  end

  def create
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

  def necklaces
    @designs = Design.necklaces
    render :index
  end

  def bracelets
    @designs = Design.bracelets
    render :index
  end

  def rings
    @designs = Design.rings
    render :index
  end

  def earrings
    @designs = Design.earrings
    render :index
  end

  private

  def design_params
    params.require(:design).permit(:user_id, :stone_id, :metal, :model)
  end

end
