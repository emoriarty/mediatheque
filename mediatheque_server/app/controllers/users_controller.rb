class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
    
    respond_to do |format|
      format.html{ render :layout => false }
    end
  end

  def create
    @user = User.new(params[:user])
    flash[:notice] = "Account created successfully" if @user.errors.empty?
    
    respond_to do |format|
      format.html{ @user.save ? redirect_to(login_path) : render('new', :layout => false) }
    end
  end

end
