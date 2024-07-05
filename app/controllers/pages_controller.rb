class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @doctors = Doctor.all
  end
end
