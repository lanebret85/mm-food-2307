require "rails_helper"

RSpec.describe Search do
  describe "exists and has readable attributes" do
    it "exists" do
      search = Search.new({ totalHits: 12345 })

      expect(search).to be_a Search
    end

    it "has readable attributes" do
      search = Search.new({ totalHits: 12345 })

      expect(search.total_hits).to eq(12345)
    end
  end
end