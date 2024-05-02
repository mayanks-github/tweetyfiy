class ProfilesController < ApplicationController
    before_action :authenticate_user

    def update
        @profile.update(profile_params)
    end

    private

    def profile_params
        params.require(:profile).permit(:full_name, :user_name, :contact_number, :age, :gender)
    end

    def profile
        @profile = current_user.profile
    end
end
