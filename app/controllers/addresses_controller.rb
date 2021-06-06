class AddressesController < ApplicationController
  def find_address
    address = AddressServices::FindAddress.new(params).call

    if address.key?(:error)
      address = ViacepServices::FindAddress.new(params).call
      CreateAddressWorker.perform_async(address[:payload], @user.id) if address[:success?]
    elsif address[:payload].user_ids.exclude?(@user.id)
      AddressServices::UpdateAddressUser.new(address[:payload], @user).call
    end

    if address[:success?]
      render json: address[:payload]
    else
      render json: { message: address[:error] }, status: :not_found
    end
  end
end
