require "rails_helper"

RSpec.describe SearchFacade do
  describe "exists" do
    it 'exists and has readable attributes' do
      search_facade = SearchFacade.new({ q: 'sweet potatoes' })

      expect(search_facade).to be_a(SearchFacade)
      expect(search_facade.query_params).to eq({ q: 'sweet potatoes'})
    end
  end

  describe "#foods" do
    it 'can return an array of food objects' do
      search_facade = SearchFacade.new({ q: 'sweet potatoes' })

      VCR.use_cassette("testing foods") do
        expect(search_facade.foods).to be_an Array

        first_food = search_facade.foods.first
        last_food = search_facade.foods.last

        expect(first_food).to be_a Food
        expect(last_food).to be_a Food
      end
    end
  end

  describe "#search" do
    it 'can return a search object' do
      search_facade = SearchFacade.new({ q: 'sweet potatoes' })

      VCR.use_cassette("testing search") do
        expect(search_facade.search).to be_a Search
      end
    end
  end
end