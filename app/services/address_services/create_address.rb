module AddressServices
  class CreateAddress
    attr_accessor :street, :zip, :complement, :neighborhood, :state, :city

    def initialize(params)
      @zip = params[:zip].gsub(/\D/, '')
      @street = params[:street]
      @complement = params[:complement]
      @neighborhood = params[:neighborhood]
      @state = params[:state]
      @city = params[:city]
    end

    def call
      address = Address.create(
        street: street,
        zip: zip,
        complement: complement,
        neighborhood: neighborhood,
        state: state,
        city: city
      )
      if address.persisted?
        { success?: true, payload: address }
      else
        { success?: false, error: address.errors }
      end
    end
  end
end
