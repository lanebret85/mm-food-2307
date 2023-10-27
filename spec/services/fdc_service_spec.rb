require "rails_helper"

RSpec.describe FdcService do
  describe "exists" do
    it 'exists and has readable attributes' do
      fdc_service = FdcService.new({ q: 'sweet potatoes' })

      expect(fdc_service).to be_a(FdcService)
      expect(fdc_service.query_params).to eq({ q: 'sweet potatoes'})
    end
  end

  describe "#food_data" do
    it 'can return an array of json food data based on a search parameter' do
      fdc_service = FdcService.new({ q: 'sweet potatoes' })

      VCR.use_cassette("testing food data") do
        expect(fdc_service.food_data).to be_an Array
      end
    end
  end

  describe "#search" do
    it 'can return a search of json data based on a search parameter' do
      fdc_service = FdcService.new({ q: 'sweet potatoes' })

      VCR.use_cassette("testing service search") do
        expect(fdc_service.search).to be_a Hash
      end
    end
  end
end