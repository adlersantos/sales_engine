require 'debugger'
require_relative 'repository'

class Merchant
  attr_reader :id, :name, :items

  def initialize(attrs)
    attrs.each { |key, value| instance_variable_set(key, value) }
    # @merchant_repo ||= MerchantRepository.new
  end

  def items
    @items ||= @merchant_repo.find_all_by_merchant_id(self.id)
  end
end