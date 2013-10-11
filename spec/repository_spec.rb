require 'repository'
require 'merchant'

describe MerchantRepository do
  let(:merchant_repo) { MerchantRepository.new }

  describe "#initialize" do
    it "creates the correct number of Merchant instances" do
      expect(merchant_repo.all.count).to eq(100)
    end

    it "creates an array that only contains Merchant instances" do
      merchants = merchant_repo.all.select { |row| row.class == Merchant }
      expect(merchants.count).to eq(merchant_repo.all.count)
    end
  end

  describe "::find_by_" do
    it "finds an attribute given a value" do
      expect(merchant_repo.find_by_name('Killback Inc'))
        .to eq(merchant_repo.find_by_id(23))
    end
  end
end