class GuideController < ApplicationController
  def index
    @guides = Store.nearby_guide(session[:zip])
    if session[:zip].nil?
      flash[:error] = 'Please Enter a Correct Zipcode to continue'
      redirect_to '/'
    elsif @guides.empty?
      redirect_to guide_search_path
    end
  end

  def search
  end
end
