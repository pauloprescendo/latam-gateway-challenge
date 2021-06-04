module ViacepServices
  class FindAddress
    include HTTParty
    base_uri 'http://viacep.com.br/ws'

    def initialize(params)
      @zip = params[:zip]
    end

    def call
      address = self.class.get("/#{zip}/json")
      if address.code.eql?(200)
        { success?: true, payload: parse_payload(address.parsed_response) }
      else
        { success?: false, error: I18n.t('api.find_address.not_found') }
      end
    rescue HTTParty::Error => e
      { success?: false, error: e }
    end

    def parse_payload(params)
      {
        zip: params['cep'],
        street: params['logradouro'],
        complement: params['complemento'],
        neighborhood: params['bairro'],
        state: params['uf'],
        city: params['localidade']
      }
    end

    private

    attr_reader :zip
  end
end
