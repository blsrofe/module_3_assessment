require "rails_helper"

describe "Bestbuy Service" do
  it "exists" do
    bestbuy = BestbuyService.new

    expect(bestbuy).to be_a(BestbuyService)
  end
end
