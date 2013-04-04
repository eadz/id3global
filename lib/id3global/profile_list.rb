class Id3global::ProfileList
  
  class << self
    def get_profile_list
      client = Id3global.create_client

      response = client.call :get_profiles do
        message Id3global.merge_password_hash({})
      end
    
      list = Array.new
    
      response = response.to_hash
      profile_response = response[:get_profiles_response][:get_profiles_result][:global_profile]
      
      if profile_response.is_a? Hash
        list << ::Id3global::Profile.new(profile_response)
      else 
        profile_response.each do |profile|
          list << ::Id3global::Profile.new(profile)
        end
      end

      list
    end
  end
  
  
end