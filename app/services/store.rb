class Store

  def self.find_by_zip(zip)
    raw_stores = BestbuyService.find_by_zip(zip)
    raw_stores.map do |store_info|
      Store.new(store_info)
    end
  end
end
