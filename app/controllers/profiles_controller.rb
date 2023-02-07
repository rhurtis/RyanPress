class ProfilesController < ApplicationController

    def new
        @profile = Profile.new
    end

    def create
        @profile = Profile.new(profile_params)
        if @profile.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
      end

      private
      def profile_params
          params.require(:profile).permit(:username, :user_id)
      end

end