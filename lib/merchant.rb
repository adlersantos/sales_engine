class Merchant
  attr_reader :name

  def initialize(attrs)
    attrs.each { |key, value| instance_variable_set(key, value) }
  end
end