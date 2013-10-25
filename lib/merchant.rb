require 'debugger'
require_relative 'repository'

class Merchant
  attr_reader :id, :name, :items

  def initialize(attrs)
    attrs.each { |key, value| instance_variable_set(key, value) }
  end

  def items
    @items || []
  end

  def set_items(repo)
    @items = repo.find_all_by_merchant_id(self.id)
  end
end