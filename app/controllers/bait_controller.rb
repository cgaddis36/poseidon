class BaitController < ApplicationController
  def index
    @baits = Store.nearby_bait(session[:state], session[:zip])
    if @baits.empty?
      redirect_to error_path
    end
  end

  def error
  end
end
