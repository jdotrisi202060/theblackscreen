class BlacksController < ApplicationController
  def index
    @blacks = Black.all
    @user = current_user
    #@black.userid = @user.id
   
  end
  
  def show
    @black = Black.find(params[:id])
    
  end
  
  def new
    @black = Black.new
  end
  
  def create
    
    if logged_in?
      @user = current_user

    else
      @user = User.find(2)
    end

    

    @black = Black.new(params[:black])

    @black.tag_list = Black.new(params[:tag_list])

    @black.user_id = @user.id

    #@black = Post.new (params[:post])


    

    if @black.save
      
      flash[:notice] = "Successfully created black."
      redirect_to @black
    else
      render :action => 'new'
    end
  end
  
  def edit
    @black = Black.find(params[:id])
  end
  
  def update
    @black = Black.find(params[:id])
    if @black.update_attributes(params[:black])
      flash[:notice] = "Successfully updated black."
      redirect_to @black
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @black = Black.find(params[:id])
    @black.destroy
    flash[:notice] = "Successfully destroyed black."
    redirect_to blacks_url
  end
end
