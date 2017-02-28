class HotReads

  def initialize(link)
    send_link_to_hot_reads(link)
  end

  def send_link_to_hot_reads(link)
    # conn = Faraday.new(:url => 'https://nameless-coast-56698.herokuapp.com/reads')
    conn = Faraday.new(:url => 'http://localhost:2999/reads')

    conn.post do |req|
      req.params['link'] = link.to_json
    end
  end
end
