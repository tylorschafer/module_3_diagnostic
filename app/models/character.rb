class Character
  attr_reader :name, :role, :house, :patronus

  def initialize(attributes = {})
    @name = attributes[:name]
    @role = attributes[:role] || 'none'
    @house = attributes[:house]
    @patronus = attributes[:patronus] || 'none'
  end
end
