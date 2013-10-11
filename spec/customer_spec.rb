require 'customer'

describe Customer do
  describe "#initialize" do

    it "sets first_name correctly" do
      customer = Customer.new('Adler', 'Santos')
      expect(customer.first_name).to eq('Adler')
    end

    it "sets last_name correctly" do
      customer = Customer.new('Adler', 'Santos')
      expect(customer.last_name).to eq('Santos')
    end
  end
end
