class CreateAddressWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(address)
    AddressServices::CreateAddress.new(address.symbolize_keys).call
  end
end
