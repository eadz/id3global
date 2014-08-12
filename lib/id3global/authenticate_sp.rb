require 'active_support/all'

class Id3global::AuthenticateSp
  def self.process(profile_id, profile_version, customer_reference, input_data)
    client = Id3global.create_client

    auth_hash = {
      "CustomerReference" => customer_reference,
      "ProfileID" => profile_id,
      "ProfileVersion" => profile_version,
      "InputData" => input_data
    }

    response = client.call :authenticate_sp do
      message Id3global.merge_password_hash(auth_hash)
    end

    response = response.to_hash

    ::Id3global::AuthenticationResult.new(response[:authenticate_sp_response][:authenticate_sp_result])
  end
end
