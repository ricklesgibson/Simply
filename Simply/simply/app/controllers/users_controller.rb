class UsersController < ApplicationController #bitchezzzzz!!!!
  def index
    @users = User.all 
  end
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
    
  def edit
      @user = User.find(params[:id])
  end

   def update
     user = User.find(params[:id])
    # respond_to do |format|
      if user.update(user_params) #could also use update_attributes method
        #format.html { redirect_to @user, notice: 'user was successfully updated.' }
        #format.json { render :show, status: :ok, location: @user }
        redirect_to user
      else
        #format.html { render :edit }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    # end
  end


  def create  
    user = User.new(params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :bio_text))
    #respond_to do |format|
      if user.save
          UserMailer.welcome(user).deliver_now
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



private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :bio_text, :avatar)
    end
end