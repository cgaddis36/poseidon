class StoreController < ApplicationController
  def create
    if store_params.include?('bait') && store_params.include?('fly')
      store = Store.new(store_params)
      store.fly = true
      store.bait = true
    elsif store_params.include?('bait')
      store = Store.new(store_params)
      store.bait = true
    elsif store_params.include?('fly')
      store = Store.new(store_params)
      store.fly = true
    else
      store = Store.new(store_params)
    end
    if store.save
      flash[:notice] = "Store successfully submitted for review."
    else
      flash[:alert] = "Not all fields were entered correctly, please try again."
    end
    redirect_to request.referrer
  end

  private

  def store_params
    params.permit(:name, :address, :city, :state, :zip, :phone_number, :fly, :bait)
  end
end
