module AddressServices
  class FindAddress
    attr_reader :zip

    def initialize(params)
      @zip = params[:zip]
    end

    def call
      address = Address.find_by(zip: zip.gsub(/\D/, ''))
      if address
        { success?: true, payload: address }
      else
        { success?: false, error: I18n.t('api.find_address.not_found') }
      end
    end
  end
end
