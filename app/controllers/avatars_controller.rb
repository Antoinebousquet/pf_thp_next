class AvatarsController < ApplicationController
	

	def create
	  if 
	    @practionner = Practionner.find(current_practionner.id)
	    @practionner.avatar.attach(params[:avatar])
	    redirect_to(practionners_path(@practionner))
	  else current_patient === true
	    @patient = Patient.find(current_patient.id)
	    @patient.avatar.attach(params[:avatar])
	    redirect_to(patients_path(@patient))
	  end
  end
end
