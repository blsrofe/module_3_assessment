require "rails_helper"

describe "store" do
  it "exists" do
    store = Store.new

    expect(store).to be_a(Store)
  end

  it "can return an array of stores" do
    stores = Store.find_by_zip("80202")

    expect(stores.count).to eq(17)
    expect(store.first).to be_a(Store)
  end
end
