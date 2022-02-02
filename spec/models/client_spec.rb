require 'spec_helper'

RSpec.describe Client, type: :model do
  it 'exists' do
    client = Client.new
    expect(client).to be_a(Client)
  end
end
