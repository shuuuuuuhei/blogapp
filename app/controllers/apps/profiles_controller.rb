class Apps::ProfilesController < Apps::ApplicationController

    def show
        @profile = current_user.profile
    end

    def edit
        @profile = current_user.prepare_profile
    end

    def update
        @profile = current_user.prepare_profile
        @profile.assign_attributes(profile_params)
        if @profile.save
            redirect_to profile_path, notice: 'プロフィールを更新'
        else
            flash.now[:error] = '更新ができませんでした'
            render :edit
        end
    end

    private
    def profile_params
        params.require(:profile).permit(
            :nickname,
            :introduction,
            :birthday,
            :gender,
            :subscribed,
            :avatar
        )
    end
end