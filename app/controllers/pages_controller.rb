class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home confirmation]

  def home
    @doctors = Doctor.all
  end
end
