class UsersController < ApplicationController

  before_filter :authenticate_user, only: [:index, ]
  before_filter :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new 
  end

  def edit
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Congratulations! You have created your account, successfully"
      redirect_to(:controller => 'sessions', :action => 'new')
    else
      flash[:notice] = "Form is invalid! Please check your credentials."
      render "new"
    end
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Your account was successfully updated."
    else
      flash[:notice] = "Oops! Please fix the errors and try again."
    end
    render :edit
  end

  def destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
