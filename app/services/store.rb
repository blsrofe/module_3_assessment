class Store
  attr_reader :long_name, :store_type, :distance, :phone_number, :city

  def initialize(attrs = {})
    @long_name = attrs[:longName]
    @store_type = attrs[:storeType]
    @distance = attrs[:distance]
    @phone_number = attrs[:phone]
    @city = attrs[:city]
  end

  def self.find_by_zip(zip)
    raw_stores = BestbuyService.find_by_zip(zip)
    raw_stores.map do |store_info|
      Store.new(store_info)
    end
  end
end
