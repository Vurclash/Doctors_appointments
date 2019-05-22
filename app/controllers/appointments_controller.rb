class AppointmentsController < ApplicationController
  before_action :set_doctor

  def index
    @medics = @doctor.appointments.where(role: "doctor")
  end

  def new
    @patients = User.all 
    @appointment = @doctor.appointments.new
  end
  

  def create
    @appointment = @doctor.appointment.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path
    else 
      render :new
    end
  end

  def destroy
    @appointment = @doctor.appointment.find(params[:id])
    @appointment.destroy
    redirect_to doctor_appointments_path
  end

  private
  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def appointment_params
    params.require(:appointment).permit(:date)
  end
end
