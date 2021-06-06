module AddressServices
  class CreateAddress
    attr_accessor :street, :zip, :complement, :neighborhood, :state, :city, :user

    def initialize(params, user_id)
      @zip = params[:zip].gsub(/\D/, '')
      @street = params[:street]
      @complement = params[:complement]
      @neighborhood = params[:neighborhood]
      @state = params[:state]
      @city = params[:city]
      @user = user_id
    end

    def call
      address = Address.create(
        street: street,
        zip: zip,
        complement: complement,
        neighborhood: neighborhood,
        state: state,
        city: city,
        user_ids: user
      )
      if address.persisted?
        { success?: true, payload: address }
      else
        { success?: false, error: address.errors }
      end
    end
  end
end
