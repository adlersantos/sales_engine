class Merchant
  attr_reader :id, :name

  def initialize(attrs)
    attrs.each { |key, value| instance_variable_set(key, value) }
  end

  def items
    []
  end
end