class DesignsController < ApplicationController

  def index
    if params[:user_id]
      @designs = User.find(params[:user_id]).designs
    else
      @designs = Design.all
    end
  end

  def create
    if params[:user_id]
      @design = Design.new(design_params)
      if @design.save
        redirect_to user_design_path(@design.user, @design)
      else
        render :new
      end
    else
      redirect_to designs_path
    end
  end

  def new
    if params[:user_id] && current_user.id == params[:user_id]
      @design = Design.new(user_id: params[:user_id])
    else
      redirect_to designs_path
    end
  end

  def show
    @design = Design.find(params[:id])
  end

  def update
    @design = Design.find(params[:id])
    @design.update(design_params)
    if @design.save
      redirect_to user_design_path(@design.user, @design)
    else
      render :edit
    end
  end

  def destroy
    authorize
    @design.destroy
    redirect_to designs_path
  end

  def edit
    authorize
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

  def authorize
    @design = Design.find(params[:id])
    unless @design.user_id == current_user.id
      flash[:notice] = "You are not the creator of this design, and do not have access to update or destroy it"
      redirect_to welcome_path
      return false
    end
  end

end
