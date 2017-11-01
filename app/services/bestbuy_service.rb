class BestbuyService

  def initialize
    @key = ENV["API_KEY"]
    @conn = Faraday.new(:url => "https://api.bestbuy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.find_by_zip(zip)
    new.find_by_zip(zip)
  end

  def find_by_zip(zip)
    response = conn.get("/v1/stores(area(#{zip},25))?format=json&show=storeType,longName,distance,phone,city&pageSize=20&apiKey=#{key}")
    JSON.parse(response.body, symbolize_names: true)[:stores]
  end

  private
    attr_reader :conn, :key
end
