class UsersController < ApplicationController #bitchezzzzz!!!!
  def index
    @user = User.all 
  end
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
    
  
  def create  
    user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
    #respond_to do |format|
      if user.save
          redirect_to new_sessions_path
        #format.html { redirect_to @user, notice: 'user was successfully created.' }
        #format.json { render :show, status: :created, location: @order }
      else
        redirect_to new_user_path
        #format.html { render :new }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    #end
  end
end