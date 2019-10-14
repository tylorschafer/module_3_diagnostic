class PhoneixMembersSearch
  def initialize(house)
    @house = house
  end

  def member_count
    members.count
  end

  def members
    conn = Faraday.new(url: 'https://www.potterapi.com/v1/characters') do |f|
      f.adapter Faraday.default_adapter
      f.params['key'] = ENV['POTTER_API_KEY']
    end

    response = conn.get do |req|
      req.params['house'] = house
      req.params['orderOfThePhoenix'] = true
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private
  attr_reader :house
end
