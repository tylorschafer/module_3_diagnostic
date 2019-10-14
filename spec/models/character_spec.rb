describe Character do
  it 'exists' do
    attrs = {
      name: 'Harry Potter',
      role: 'Student',
      house: 'Gryffindor',
      patronus: 'Bird Thing?'
    }

    harry = Member.new(attrs)

    expect(harry).to be_a Member
    expect(harry[:name]).to eq(attrs[:name])
    expect(harry[:role]).to eq(attrs[:role])
    expect(harry[:house]).to eq(attrs[:name])
    expect(harry[:patronus]).to eq(attrs[:name])
  end
end
