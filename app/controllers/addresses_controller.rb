class AddressesController < ApplicationController
  def find_address
    address = AddressServices::FindAddress.new(params).call

    if address.key?(:error)
      address = ViacepServices::FindAddress.new(params).call
      address = AddressServices::CreateAddress.new(address[:payload]).call if address[:success?]
    end

    if address[:success?]
      render json: address[:payload]
    else
      render json: { message: address[:error] }, status: :not_found
    end
  end
end
