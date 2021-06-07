module AddressServices
  class UpdateAddressUser
    attr_accessor :address, :user_id

    def initialize(address, user_id)
      @address = address
      @user_id = user_id
    end

    def call
      address.user_ids << user_id
      if address.save
        { success?: true, payload: address }
      else
        { success?: false, error: address.errors }
      end
    end
  end
end
