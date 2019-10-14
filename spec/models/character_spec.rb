require 'rails_helper'

describe Character do
  it 'exists' do
    attrs = {
      name: 'Harry Potter',
      role: 'Student',
      house: 'Gryffindor',
      patronus: 'Bird Thing?'
    }

    harry = Character.new(attrs)

    expect(harry).to be_a Character
    expect(harry.name).to eq(attrs[:name])
    expect(harry.role).to eq(attrs[:role])
    expect(harry.house).to eq(attrs[:house])
    expect(harry.patronus).to eq(attrs[:patronus])
  end
end
