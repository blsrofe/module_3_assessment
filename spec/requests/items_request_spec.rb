require "rails_helper"

describe "Items API" do
  it "returns a list of all items" do
    Item.create!(name: "Item1", description: "Something", image_url: "www.google.com")
    Item.create!(name: "Item2", description: "Something", image_url: "www.google.com")
    Item.create!(name: "Item3", description: "Something", image_url: "www.google.com")
    Item.create!(name: "Item4", description: "Something", image_url: "www.google.com")

    get '/api/v1/items'

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(4)
  end

  it "returns an item" do
    item = Item.create!(name: "Item1", description: "Something", image_url: "www.google.com")

    get "/api/v1/items/#{item.id}"

    returned_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item.name).to eq(returned_item["name"])
  end
end
