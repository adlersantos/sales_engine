require 'repository'
require 'merchant'
require 'item'
require 'debugger'

describe Merchant do
  let(:merchant_repo) { MerchantRepository.new }
  let(:item_repo) { ItemRepository.new }
  let(:fake_merchant) { Merchant.new('@name' => 'Faceless') }

  describe "#items" do
    it "returns an array of items belonging to the merchant" do
      expect(merchant_repo.find_by_id(54).items).to include(item_repo.find_by_id(1181))
    end

    it "returns [] if no items belong to the merchant" do
      expect(fake_merchant.items).to eq([])
    end
  end
end