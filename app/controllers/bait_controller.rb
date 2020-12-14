class BaitController < ApplicationController
  def index
    @baits = BaitService.new.get_shops(session[:zip])
    require "pry"; binding.pry
  end
end
