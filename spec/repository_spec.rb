require 'spec_helper'

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
    it "finds an item given an attribute and its value" do
      expect(merchant_repo.find_by_name('Kilback Inc'))
        .to eq(merchant_repo.find_by_id(23))
    end

    it "returns an empty array when no match is found" do
      expect(merchant_repo.find_by_name('Yadda yadda'))
        .to eq([])
    end
  end

  describe "::find_all_by_" do
    it "finds all items whose attribute matches the given value" do
      expect(merchant_repo.find_all_by_name('Terry-Moore'))
        .to eq(merchant_repo.find_all_by_id(84))
    end

    it "returns an empty array when no match is found" do
      expect(merchant_repo.find_all_by_name('Yadda yadda'))
        .to eq([])
    end
  end
end

describe ItemRepository do
  let(:item_repo) { ItemRepository.new }

  describe "#initialize" do
    it "creates an array that only contains Item instances" do
      items = item_repo.all.select { |row| row.class == Item }
      expect(items.count).to eq(item_repo.all.count)
    end
  end

  describe "::find_by_" do
    it "finds an attribute given a value" do
      expect(item_repo.find_by_name('Item Aut Odit'))
        .to eq(item_repo.find_by_id(1341))
    end
  end

  describe "::find_all_by_merchant_id" do
    it "finds all the items given a merchant_id" do
      # puts item_repo.find_all_by_merchant_id(45736)
    end
  end
end