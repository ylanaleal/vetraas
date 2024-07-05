class UsersController < ApplicationController
  def show
    @doctors = Doctor.all if current_user.admin && !Doctor.all.empty?
    @doctor = Doctor.new
    @specialty = Specialty.new
  end
end
