class BaitController < ApplicationController
  def index
    @baits = Store.nearby_bait(session[:state], session[:zip])
    if session[:zip].nil?
      flash[:error] = 'Please Enter a Correct Zipcode to continue'
      redirect_to '/'
    elsif @baits.empty?
      redirect_to bait_search_path
    end
  end

  def search
  end
end
