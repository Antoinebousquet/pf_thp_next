class AvatarsController < ApplicationController
	def create
    @practionner = Practionner.find(current_practionner.id)
    @practionner.avatar.attach(params[:avatar])
    redirect_to(practionners_path(@practionner))
  end
end
