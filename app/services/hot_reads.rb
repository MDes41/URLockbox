class HotReads

  def initialize(link)
    send_link_to_hot_reads(link)
  end

  def send_link_to_hot_reads(link)
    conn = Faraday.new(:url => 'https://nameless-coast-56698.herokuapp.com')

    conn.post do |req|
      req.url '/reads'
      req.params['link'] = link.to_json
    end
  end
end
