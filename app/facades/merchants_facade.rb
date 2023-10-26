class MerchantsFacade
  def initialize
    @service = MerchantsService.new
  end

  def merchants
    data = @service.get_all
    data[:data].map do |data|
      Merchant.new(data)
    end
  end

  def merchant(id)
    data = @service.get_one(id)
    Merchant.new(data[:data])
  end

  def merchant_items(id)
    data = @service.get_items(id)
    data[:data].map do |data|
      Item.new(data)
    end
  end
end