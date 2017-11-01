require "rails_helper"

describe "user can search for stores by zip" do
  it "returns a list of stores" do
    visit "/"
    fill_in 'Enter zip', with: "80202"
    click_on "Search"

    expect(current_path).to eq("/search")
    expect(page).to have_content("17 Total Stores")
    expect(page).to have_css(".store", count: 10)
    within(first(".store")) do
      expect(page).to have_css(".long_name")
      expect(page).to have_css(".city")
      expect(page).to have_css(".distance")
      expect(page).to have_css(".phone_number")
      expect(page).to have_css(".store_type")
    end
  end
end
