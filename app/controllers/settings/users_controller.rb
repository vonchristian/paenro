module Settings
  class UsersController < ApplicationController
    def index
      @users = User.all
    end
    def new
      @user = User.new
    end
    def create
      @user = User.create(user_params)
      if @user.save
        redirect_to settings_user_url(@user), notice: "User registered successfully."
      else
        render :new
      end
    end

    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      if @user.save
        redirect_to settings_user_url(@user), notice: "user updated successfully."
      else
        render :edit
      end
    end

    private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :middle_name, :last_name, :designation, :avatar)
    end
  end
end
