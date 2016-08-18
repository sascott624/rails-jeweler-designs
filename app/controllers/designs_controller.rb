class DesignsController < ApplicationController

  before_action :authorize_design_owner, only: [:edit, :destroy]

  def index
    if params[:user_id]
      @designs = User.find(params[:user_id]).designs
    else
      @designs = Design.all
      render json: @designs
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
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @design }
    end
  end


  def destroy
    @design.destroy
    redirect_to designs_path
  end

  def edit
    if params[:user_id]
      @user = User.find(params[:user_id])
      @design = @user.designs.find_by(id: params[:id])
    else
      redirect_to user_design_path(@user, @design)
    end
  end


  def create
    if params[:design][:user_id]
      @user = User.find(params[:design][:user_id])
      @design = @user.designs.build(design_params)

      # if the user has neither selected nor created a stone ----------------->
      if params[:design][:stone_id] == "" && params[:design][:stone_attributes][:name] == ""
        @design.errors.add(:incomplete_form, "Please select or create a stone.")
        render :edit
      end

      # if the user has selected a stone from the dropdown ------------------>
      if params[:design][:stone_id] != "" && params[:design][:stone_id] != "new"
        @design.stone = Stone.find(params[:design][:stone_id])
        if @design.save
          redirect_to user_design_path(@user, @design)
        else
          render :new
        end

      # if the user has created a new stone ---------------------------->
      else
        @design.stone_attributes=(params[:design][:stone_attributes])
        if @design.stone.save
          @design.stone_id = @design.stone.id
          if @design.save
            redirect_to user_design_path(@user, @design)
          else
            render :new
          end
        end
      end

    else # if there is no user ----------------------->
      redirect_to designs_path
    end
  end



  def update
    if params[:design][:user_id]
      @user = User.find(params[:design][:user_id])
      @design = @user.designs.find_by(id: params[:id])

      # if the user has neither selected nor created a stone ----------------->
      if params[:design][:stone_id] == "" && params[:design][:stone_attributes][:name] == ""
        @design.errors.add(:incomplete_form, "Please select or create a stone.")
        render :edit
      end

      @design.update(design_params)
      if params[:design][:stone_id] != "" && params[:design][:stone_id] != "new"
        @design.stone = Stone.find(params[:design][:stone_id])
        if @design.save
          redirect_to user_design_path(@user, @design)
        else
          @design.errors.add(:incomplete, "Please select or create a stone.")
          render :edit
        end

      else
        @design.stone_attributes=(params[:design][:stone_attributes])
        if @design.stone.save
          @design.stone_id = @design.stone.id
          if @design.save
            redirect_to user_design_path(@user, @design)
          else
            @design.errors.add(:incomplete, "Please select or create a stone.")
            render :edit
          end
        end
      end

    else
      redirect_to designs_path
    end
  end



#---------------- model methods ------------------>
  def necklaces
    @designs = Design.necklaces
    render :index
  end

  def bracelets
    @designs = Design.bracelets
    # respond_to do |f|
    #   f.html { render :index }
    #   f.json { render json: @designs }
    # end
    render :index
  end

  def rings
    @designs = Design.rings
    # respond_to do |f|
    #   f.html { render :index }
    #   f.json { render json: @designs }
    # end
    render :index
  end

  def earrings
    @designs = Design.earrings
    render :index
  end

  #---------------- model methods ------------------>


  private

  def design_params
    params.require(:design).permit(:user_id, :stone_id, :metal, :model, stone_attributes: [:name, :weight, :cost])
  end

  def design_find
    @design = Design.find(params[:id])
  end

  def authorize_design_owner
    design_find
    unless @design.user_id == current_user.id
      flash[:notice] = "You are not the creator of this design, and do not have access to update or destroy it"
      redirect_to welcome_path
      return false
    end
  end

end
