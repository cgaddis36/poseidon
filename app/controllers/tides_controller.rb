class TidesController < ApplicationController
  def show
    @tides = TidesService.new.get_tides(session[:zip])

  end
end
