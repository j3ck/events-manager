class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    redirect_to root_url
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :address, :date_birth, {category_ids: []})
  end
end
