require 'rails_helper'

RSpec.describe "Foods" do
  describe "As a user" do
    describe "When I visit '/' and I fill in the search form with 'sweet potatoes' and I click 'Search'" do
      it "Then I should be on page '/foods' and I should see a total of the number of items returned by the search and I should see a list of TEN foods that contain the ingredient 'sweet potatoes' and for each of the foods I should see:
      - The food's GTIN/UPC code
      - The food's description
      - The food's Brand Owner
      - The food's ingredients" do
        visit '/'

        fill_in :q, with: 'sweet potatoes'

        VCR.use_cassette("sweet potatoes") do
          click_on 'Search'

          expect(current_path).to eq("/foods")

          expect(page).to have_content("Results Found: 56663")

          expect(page).to have_content("SWEET POTATOES")
          expect(page).to have_content("GTIN/UPC Code: 8901020020844")
          expect(page).to have_content("Brand Owner: NOT A BRANDED ITEM")
          expect(page).to have_content("Ingredients: ORGANIC SWEET POTATOES")

          expect(page).to have_content("SWEET POTATOES")
          expect(page).to have_content("GTIN/UPC Code: 046567926179")
          expect(page).to have_content("Brand Owner: Raley's")
          expect(page).to have_content("Ingredients: SWEET POTATOES.")

          expect(page).to have_content("SWEET POTATOES")
          expect(page).to have_content("GTIN/UPC Code: 757404000104")
          expect(page).to have_content("Brand Owner: Southern Produce Distributors, Inc.")
          expect(page).to have_content("Ingredients: ORGANIC SWEET POTATOES")
        end
      end
    end
  end
end