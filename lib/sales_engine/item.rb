class Item
  attr_reader :id, :name

  def initialize(attrs)
    attrs.each { |key, value| instance_variable_set(key, value) }
  end
end
