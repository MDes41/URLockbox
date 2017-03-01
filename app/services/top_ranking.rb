class TopRanking

  def initialize
    @conn = Faraday.new(:url => 'http://localhost:2999')
    # conn = Faraday.new(:url => 'https://nameless-coast-56698.herokuapp.com/reads')
  end

  def get_top_ten
    response = @conn.get do |req|
      req.url 'api/v1/reads'
    end
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
