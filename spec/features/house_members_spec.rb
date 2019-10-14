require 'rails_helper'

# As a user,
describe 'As a user', :vcr do
  describe 'From the root path' do
    it 'I can search order of the phoenix members by house with the dropdown menu' do
      visit '/'

      within '.select-field' do
        select 'Gryffindor'
      end

      click_on 'Search For Members'
      expect(current_path).to eq('/search')
      expect(page).to have_content('21 members')
      expect(page).to have_css('.members')

      within(first('.character')) do
        expect(page).to have_css('.name')
        expect(page).to have_css('.role')
        expect(page).to have_css('.house')
        expect(page).to have_css('.patronus')
      end
    end
  end
end
