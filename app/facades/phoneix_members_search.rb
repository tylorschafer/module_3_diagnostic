class PhoneixMembersSearch
  def initialize(house)
    @house = house
  end

  def character_count
    characters.count
  end

  def characters
    conn = Faraday.new(url: 'https://www.potterapi.com/v1/characters') do |f|
      f.adapter Faraday.default_adapter
      f.params['key'] = ENV['POTTER_API_KEY']
    end

    response = conn.get do |req|
      req.params['house'] = house
      req.params['orderOfThePhoenix'] = true
    end

    character_data = JSON.parse(response.body, symbolize_names: true)

    character_data.map do |char_data|
      Character.new(char_data)
    end
  end

  private
  attr_reader :house
end
