class SessionsController < ApplicationController
  
  skip_before_filter :signed_in?, :only => [:create, :signin]
  
  def signin
    @user = User.new
      
    respond_to do |format|
      format.html
    end
  end

  def create
    @user = User.find_by_nick(params[:user][:nick]) or User.find_by_email(params[:user][:nick])
    
    if @user.nil?
      @user = User.new
      flash.now[:error] = "User doesn't exist"
    else
      @user = User.authenticate params[:user][:nick], params[:user][:password]
      if @user
        session[:user_salt] = @user.salt
        session[:user_id] = @user.id
      else
        @user = User.new
        flash.now[:error] = "User/Password is wrong"
      end
    end

    respond_to do |format|
      format.html{ flash[:error] ? render('signin') : redirect_to(root_path) }
    end
  end
  
  def signout
    session[:user_salt] = nil
    session[:user_id] = nil
    
    respond_to do |format|
      format.html{ redirect_to root_path }
    end
  end

end
