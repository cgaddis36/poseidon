class BaitService
  def get_shops(zip)
    require "pry"; binding.pry
    response = conn.get('', {})
  end

  private

  def conn
    Faraday.new(url: '')
  end
end
