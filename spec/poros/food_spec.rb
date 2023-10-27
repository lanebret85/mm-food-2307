require "rails_helper"

RSpec.describe Food do
  describe "exists and has readable attributes" do
    it "exists" do
      sweet_potatoes = Food.new({
        gtinUpc: 123456789,
        description: "Sweet Potatoes",
        brandOwner: "Nobody owns me",
        ingredients: "potatoes, sweetness"
      })

      expect(sweet_potatoes).to be_a Food
    end

    it "has readable attributes" do
      sweet_potatoes = Food.new({
        gtinUpc: 123456789,
        description: "Sweet Potatoes",
        brandOwner: "Nobody owns me",
        ingredients: "potatoes, sweetness"
      })

      expect(sweet_potatoes.gtin_upc).to eq(123456789)
      expect(sweet_potatoes.description).to eq("Sweet Potatoes")
      expect(sweet_potatoes.brand_owner).to eq("Nobody owns me")
      expect(sweet_potatoes.ingredients).to eq("potatoes, sweetness")
    end
  end
end