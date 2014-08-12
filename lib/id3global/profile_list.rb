class Id3global::ProfileList

  class << self
    def get_profile_list
      client = Id3global.create_client

      response = client.call :get_profiles do
        message Id3global.merge_password_hash({})
      end

      response = response.to_hash
      profile_response = response[:get_profiles_response][:get_profiles_result][:global_profile]

      if profile_response.is_a? Hash
        Array.wrap(::Id3global::Profile.new(profile_response))
      else
        profile_response.map do |profile|
          ::Id3global::Profile.new(profile)
        end
      end
    end
  end
end
