class FlyController < ApplicationController
  def index
    @flys = Store.nearby_fly(session[:zip])
    if session[:zip].nil?
      flash[:error] = 'Please Enter a Correct Zipcode to continue'
      redirect_to '/'
    elsif @flys.empty?
      redirect_to fly_search_path
    end
  end

  def search
  end
end
