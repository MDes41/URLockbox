class HotReads

  def initialize(link)
    send_link_to_hot_reads(link)
  end

  def send_link_to_hot_reads(link)
    conn = Faraday.new(:url => 'http://localhost:2999')
    # https://hot-reads.herokuapp.com

    conn.post do |req|
      req.params['url'] = link.url.to_json
    end
  end

end
