class StaticPagesController < ApplicationController
    def create
        @user = User.create( user_params )
      end
      
      private
      
      # Use strong_parameters for attribute whitelisting
      # Be sure to update your create() and update() controller methods.
      
      def user_params
        params.require(:user).permit(:avatar, :avatar_original_w, :avatar_original_h,:avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h)
      end
end
