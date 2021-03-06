class DashboardController < ApplicationController
  before_action :authenticate_admin!
  def index
    @schools = School.all
    @hash = Gmaps4rails.build_markers(@schools) do |school, marker|
      marker.lat school.latitude
      marker.lng school.longitude
    end
  end
end
