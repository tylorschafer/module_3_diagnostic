require 'rails_helper'

# As a user,
describe 'As a user' do
  describe 'From the root path' do
    it 'I can search order of the phoenix members by house with the dropdown menu' do
      # When I visit "/"
      visit '/'
      # And I Select "Griffindor" from the select field
      # (Note: Use the existing select field)
      select "Griffindor", from: 'nav navbar-nav'
      # And I click "Search For Members"
      click_on 'Search For Members'
      # Then I should be on page "/search"
      expect(current_path).to eq('/search')
      # Then I should see a total of the number of members for that house. (18 for Griffindor)
      expect(page).to have_content('18 members')
      # Then I should see a list of 18 members
      expect(page).to have_css('.members')
      # And for each of the members I should see:
      # - The name of the member
      # - The members role (if it exists)
      # - The house the member belongs to
      # - The Patronus of the member (if it exists)
      within(first('.member')) do
        expect(page).to have_css('.name')
        expect(page).to have_css('.role')
        expect(page).to have_css('.house')
        expect(page).to have_css('.patronus')
      end
    end
  end
end
