class PhoneixMembersSearch
  def initialize(house)
    @house = house
  end

  def character_count
    characters.count
  end

  def characters
    service = PhoenixMembersService.new
    service.characters_by_house(house).map do |char_data|
      Character.new(char_data)
    end
  end

  private
  attr_reader :house
end
