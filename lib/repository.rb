require 'csv'
require_relative 'merchant'

class Repository
  attr_reader :all

  def initialize(filename="", klass=nil)
    contents = CSV.table("./data/#{filename}",
                        headers: true,
                        header_converters: :symbol)
    headers = contents.headers
                      .map! { |attr_name| ('@' + attr_name.to_s).to_sym }

    @all = contents.collect do |row|
      attrs = Hash[headers.zip(row.fields)]
      klass.new(attrs)
    end
  end

  def find_all_by_attr(attr_name, value)
    attr_name = ('@' + attr_name.to_s).to_sym
    @all.select { |item| item.instance_variable_get(attr_name) == value }
  end

  def find_by_attr(attr_name, value)
    attr_name = ('@' + attr_name.to_s).to_sym
    @all.detect { |item| item.instance_variable_get(attr_name) == value } || []
  end

  def method_missing(method, *args, &block)
    if method.to_s =~ /^find_by_(.+)$/
      find_by_attr($1, args[0])
    elsif method.to_s =~ /^find_all_by_(.+)$/
      find_all_by_attr($1, args[0])
    else
      super
    end
  end

  def random
    @all.sample
  end
end

class MerchantRepository < Repository
  def initialize(filename="merchants.csv", klass=Merchant)
    super(filename, klass)
  end
end

class ItemRepository < Repository
  def initialize(filename="items.csv", klass=Item)
    super(filename, klass)
  end
end

class Invoice < Repository
  def initialize(filename="invoices.csv")
    super(filename, klass)
  end
end