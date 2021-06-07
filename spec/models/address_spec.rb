require 'rails_helper'

RSpec.describe Address, type: :model do
  subject { described_class.new }
  let(:address) { create(:address) }

  it 'is valid' do
    expect(address).to be_valid
  end

  it 'is not valid because the zip must be unique' do
    new_address = build(:address)
    new_address.zip = subject.zip
    expect(new_address).to_not be_valid
  end

  it 'is not valid without zip' do
    expect(subject).to_not be_valid
  end
end
