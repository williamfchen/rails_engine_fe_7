class MerchantsService
  def initialize
    @conn = Faraday.new(url: 'http://localhost:3000')
  end

  def get_all
    response = @conn.get('/api/v1/merchants')
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_one(id)
    response = @conn.get("/api/v1/merchants/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_items(id)
    response = @conn.get("/api/v1/merchants/#{id}/items")
    JSON.parse(response.body, symbolize_names: true)
  end
end
