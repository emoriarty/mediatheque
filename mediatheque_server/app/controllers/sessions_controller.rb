class SessionsController < ApplicationController
  
  def signin
    @user = User.new
      
    respond_to do |format|
      format.html
    end
  end

  def create
    user = User.find_by_nick(params[:user][:nick]) or User.find_by_email(params[:user][:nick])

    if user.nil?
      @user = User.new
      flash[:error] = "User doesn't exist"
    else
      user = User.authenticate params[:user][:nick], params[:user][:password]
      if user
        session[:user] = user
      else
        flash[:error] = "User/Password is wrong"
      end
    end
    
    respond_to do |format|
      format.html{ flash[:error] ? render('signin') : redirect_to(root_path) }
    end
  end
  
  def signout
    session[:user] = nil
    
    respond_to do |format|
      format.html{ redirect_to home_path }
    end
  end

end
