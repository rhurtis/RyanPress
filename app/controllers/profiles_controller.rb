class ProfilesController < ApplicationController

    def new
        @profile = Profile.new
    end

end