require 'rails_helper'

describe PhoenixMembersService do
  it "Returns members by house" do
    search = subject.characters_by_house('Gryffindor')

    expect(serach).to be_an Array
    expect(search.count).to eq(21)

    first_char = search.first

    expect(first_char).to have_key[:name]
    expect(first_char).to have_key[:role]
    expect(first_char).to have_key[:house]
    expect(first_char).to have_key[:patronus]
  end
end
