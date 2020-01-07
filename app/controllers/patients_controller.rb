class PatientsController < ApplicationController
before_action :authorize_user, except: [:index]

  def index
    @patient = Patient.find(current_patient.id)
  end

  def show
  	@patient_day = Patient.find(params[:id]).days
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient = Patient.update(patient_params)
    redirect_to edit_patient_path
    else
    render 'modifier'
    end 
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name,:last_name, :treatment, :city, :birth, :sexe)
  end

  def authorize_user 
    @user = Patient.find(params[:id])
    @user_practionner = @user.practionners

    @user_practionner.each do |practionner|
      if practionner == current_practionner
        @count = 1
      end
    end

    if @user == current_patient
      @count = 1
    end

    if @count != 1
      flash[:danger] = "Veuillez vous connecter."
      redirect_to new_patient_session_path
    else
    end
  end

end

