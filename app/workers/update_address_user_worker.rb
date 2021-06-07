class UpdateAddressUserWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(address_id, user_id)
    address = Address.find(address_id)
    AddressServices::UpdateAddressUser.new(address, user_id).call
  end
end
