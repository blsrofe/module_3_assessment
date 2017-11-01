class BestbuyService

  def self.find_by_zip(zip)
    new.find_by_zip(zip)
  end

  def find_by_zip(zip)
    key = ENV["API_KEY"]
    conn = Faraday.new(:url => "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeType,longName,distance,phone,city&apiKey=#{key}") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)[:stores]
  end
end
