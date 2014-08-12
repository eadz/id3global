require 'active_support/all'

class Id3global::AuthenticateSp
  def self.process(user_data, uk_data)
    client = Id3global.create_client

    auth_hash = {
      "CustomerReference" => SecureRandom.hex(16),
      "ProfileID" => Id3global.configuration.profile_id,
      "ProfileVersion" => Id3global.configuration.profile_version,
      "InputData" => {
        "Addresses" => uk_data.to_prove_hash
      }
    }

    auth_hash["InputData"].merge!(user_data.to_prove_hash)

    response = client.call :authenticate_sp do
      message Id3global.merge_password_hash(auth_hash)
    end

    response = response.to_hash

    ::Id3global::AuthenticationResult.new(response[:authenticate_sp_response][:authenticate_sp_result])
  end
end
