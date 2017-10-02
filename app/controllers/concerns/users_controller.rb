class UsersController < ApplicationController

    def index
      @users = User.all
    end
  
    def show
      @user = User.find(params[:id])
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(allowed_params)
      if @user.save
        if params[:user][:avatar].present?
          render :crop
        else
          redirect_to @user, notice: "Successfully created user."
        end
      else
        render :new
      end
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
      if @user.update_attributes(allowed_params)
        if params[:user][:avatar].present?
          render :crop
        else
          redirect_back(fallback_location: root_path)
        end
      else
        render :new
      end
    end
    def remove_photo
      current_user.avatar = nil
      current_user.save
      redirect_back(fallback_location: root_path)
    end
    
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_url, notice: "Successfully destroyed user."
    end
    
    private
   
    def allowed_params
      params.require(:user).permit!
    end
  end