require 'csv'
require 'sales_engine/repository'
require 'sales_engine/merchant'
require 'sales_engine/customer'
require 'sales_engine/item'

class SalesEngine
  repositories = [:merchant_repository,
                  :invoice_repository,
                  :item_repository,
                  :invoice_item_repository,
                  :customer_repository,
                  :transactions_repository]

  attr_reader *repositories

  def startup
    # set all repositories as instance variables
  end
end