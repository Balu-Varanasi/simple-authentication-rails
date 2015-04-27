class SessionsController < ApplicationController

  before_filter :save_login_state, :only => [:login, :create]
  
  def new
  end

  def create
	authorized_user = User.authenticate(params[:username_or_email], params[:password])
	if authorized_user
	  session[:user_id] = authorized_user.id
	  flash[:notice] = "You are succesfully logged in as #{authorized_user.username}"
	  redirect_to(:controller => 'home', :action => 'dashboard')
	else
	  flash[:notice] = "Invalid Credentials!"
	  redirect_to(:controller => 'sessions', :action => 'new')
	end
  end

  def destroy
	session[:user_id] = nil
	redirect_to :action => 'new'
  end
end
