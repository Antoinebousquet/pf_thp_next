class AvatarsController < ApplicationController
	

	def create
	  if current_practionner === true
	    @practionner = Practionner.find(current_practionner.id)
	    @practionner.avatar.attach(params[:avatar])
	    redirect_to(practionners_path(@practionner))
	  else 
	    @patient = Patient.find(current_patient.id)
	    @patient.avatar.attach(params[:avatar])
	    redirect_to(patients_path(@patient))
	  end
  end
end
