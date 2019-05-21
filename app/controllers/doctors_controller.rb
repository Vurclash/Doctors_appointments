class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :destroy]

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(user_params)

    if @doctor.save
      redirect_to doctors_path
    else 
      render :new
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

  private 
  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

end
