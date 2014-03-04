require 'csv'
require_relative 'merchant'

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