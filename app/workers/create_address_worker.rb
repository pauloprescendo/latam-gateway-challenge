class CreateAddressWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(address, user_id)
    AddressServices::CreateAddress.new(address.symbolize_keys, user_id).call
  end
end
