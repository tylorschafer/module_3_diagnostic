class PhoenixMembersService

  def characters_by_house(house)
    get_json("/characters", house)
  end

  private

  def conn
    Faraday.new(url: 'https://www.potterapi.com/v1/characters') do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url, house)
    response = conn.get do |req|
      req.params['key'] = ENV['POTTER_API_KEY']
      req.params['house'] = house
      req.params['orderOfThePhoenix'] = true
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
