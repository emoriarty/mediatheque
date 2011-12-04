class UsersController < ApplicationController
  
  def index
  end

  def new
    @user = User.new
    
    respond_to do |format|
      format.html
    end
  end

  def create
    @user = User.new(params[:user])
    flash[:notice] = "Account created successfully" if @user.save
    
    respond_to do |format|
      format.html{ flash[:notice] ? redirect_to(signin_path) : render('new') }
    end
  end

end
