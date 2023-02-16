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

    def show
        puts 'profiles_id' , params[:id]
        @profile = Profile.find(params[:id])
    end

      private
      def profile_params
          params.require(:profile).permit(:username, :user_id)
      end

end