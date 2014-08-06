class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end

  def crp
    @profile = Profile.find(params[:profile_id])
    render "crop"
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
      if params[:profile][:avatar].blank?
        if @profile.cropping?
          @profile.avatar.reprocess!
        end
        redirect_to @profile
      else
        render :action => "crop"
      end
    #redirect_to root_url
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :date_birth, {category_ids: []}, :avatar, :crop_x, :crop_y, :crop_w, :crop_h)
  end
end
