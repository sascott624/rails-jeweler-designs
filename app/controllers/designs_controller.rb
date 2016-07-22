class DesignsController < ApplicationController

  def index
    if params[:user_id]
      @designs = User.find(params[:user_id]).designs
    else
      @designs = Design.all
    end
  end

  def create
    if params[:design][:user_id]
      @user = User.find(params[:design][:user_id])
      @design = @user.designs.build(design_params)
      if @design.save
        redirect_to user_design_path(@user, @design)
      else
        render :new
      end
    else
      redirect_to designs_path
    end
  end

  def new
    if params[:user_id] && current_user
      @design = Design.new(user_id: current_user.id)
    else
      redirect_to user_designs_path
    end
  end

  def show
    design_find
  end

  def update
    if params[:design][:user_id]
      @user = User.find(params[:design][:user_id])
      @design = @user.designs.find_by(id: params[:id])
      @design.update(design_params)
      if @design.save
        redirect_to user_design_path(@design.user, @design)
      else
        render :edit
      end
    end
  end

  def destroy
    authorize
    @design.destroy
    redirect_to designs_path
  end

  def edit
    if params[:user_id]
      @user = User.find(params[:user_id])
      @design = @user.designs.find_by(id: params[:id])
    else
      redirect_to user_designs_path(@user)
    end
  end


#---------------- model methods ------------------>
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

  #---------------- model methods ------------------>

  def stones_attributes=(stone_attribute)
    @stone = Stone.find_or_create_by(stones_attributes)
    if @stone.save
      self.stone_id = @stone.id
    end
  end

  private

  def design_params
    params.require(:design).permit(:user_id, :stone_id, :metal, :model, stones_attributes: [:name, :weight, :cost])
  end

  def design_find
    @design = Design.find(params[:id])
  end

  def authorize
    design_find
    unless @design.user_id == current_user.id
      flash[:notice] = "You are not the creator of this design, and do not have access to update or destroy it"
      redirect_to welcome_path
      return false
    end
  end

end
