class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
     @user = User.new(user_params)

     if @user.save
       flash[:success] = "Great! User has been signed up successfully!"
       redirect_to new_user_path
     else
      flash[:warning]=" Sorry! User has not been signed up successfully!"
      render :new, status: :unprocessable_entity
     end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = "Great! User has been updated successfully!"
      redirect_to new_user_path
    else
      flash[:warning]=" Sorry! User has not been updated successfully!"
      render :edit, status: :unprocessable_entity
    end
  
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
