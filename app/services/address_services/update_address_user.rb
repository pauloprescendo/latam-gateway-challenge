module AddressServices
  class UpdateAddressUser
    attr_accessor :address, :user

    def initialize(address, user)
      @address = address
      @user = user
    end

    def call
      @address.users << user
      if address.save
        { success?: true, payload: address }
      else
        { success?: false, error: address.errors }
      end
    end
  end
end
