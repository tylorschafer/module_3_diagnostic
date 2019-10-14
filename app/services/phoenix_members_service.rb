class PhoenixMembersService

  def characters_by_house(house)
    get_json("v1/characters?house=#{house}&orderOfThePhoenix=true")
  end

  private

  def conn
    Faraday.new(url: 'https://www.potterapi.com') do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url) do |req|
      req.params['key'] = ENV['POTTER_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
