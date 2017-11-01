class Store
  attr_reader :long_name, :store_type, :distance, :phone_number, :city

  def initialize(attrs = {})
    @long_name = attrs[:stores][:longName]
    @store_type = attrs[:stores][:storeType]
    @distance = attrs[:stores][:distance]
    @phone_number = attrs[:stores][:phone]
    @city = attrs[:stores][:city]
  end

  def self.find_by_zip(zip)
    raw_stores = BestbuyService.find_by_zip(zip)
    binding.pry
    raw_stores.map do |store_info|
      Store.new(store_info)
    end
  end
end
