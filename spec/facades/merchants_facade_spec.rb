RSpec.describe MerchantsFacade do
  describe '#merchants' do
    it 'returns an array of Merchant objects' do
      stubbed_response = {
        data: [
          { id: "1", type: "merchant", attributes: { name: "Merchant One" } },
          { id: "2", type: "merchant", attributes: { name: "Merchant Two" } }
        ]
      }

      allow(Faraday).to receive(:get).and_return(double(body: stubbed_response.to_json))

      facade = MerchantsFacade.new
      merchants = facade.merchants

      expect(merchants).to be_an(Array)
      expect(merchants.first).to be_a(Merchant)
      expect(merchants.first.name).to eq("Merchant One")
    end
  end
end
