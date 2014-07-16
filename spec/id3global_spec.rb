require 'id3global'

describe Id3global::ProfileList do
  it "should connect to the WS and retrieve a profile list" do
    
    configure_id3_for_test #:debug
    
    profiles = Id3global::ProfileList.get_profile_list()

    profiles.each do |profile|
      puts profile.id
      puts profile.version
    end

    profiles.length.should_not == 0
  end
end

describe Id3global::AuthenticateSp do

  it "should authenticate with fixed format address" do
    configure_id3_for_test

    personal_data = Id3global::PersonalData.new()
    personal_data.title = "Mr"
    personal_data.forename = "Michael"
    personal_data.surname = "Black"
    personal_data.dob = Date.new(1985,4,26)

    uk_data = Id3global::Addresses.new()
    uk_data.current_address = Id3global::Address.new()

    uk_data.current_address.fixed_format = Id3global::FixedAddress.new()
    uk_data.current_address.fixed_format.premise = "44"
    # uk_data.current_address.fixed_format.sub_street = ""
    uk_data.current_address.fixed_format.street = "Cherry Tree Road"
    uk_data.current_address.fixed_format.city = "Wirral"
    uk_data.current_address.fixed_format.postcode = "CH4 69RF"

    result = Id3global::AuthenticateSp.process(personal_data, uk_data)

    result.band_text.should == "PASS"
  end
  
  it "should authenticate with fixed format address" do
    configure_id3_for_test
  
    personal_data = Id3global::PersonalData.new()
    personal_data.title = "Mr"
    personal_data.forename = "Michael"
    personal_data.surname = "Black"
    personal_data.dob = Date.new(1985,4,26)

    uk_data = Id3global::Addresses.new()
    uk_data.current_address = Id3global::Address.new()
  
    uk_data.current_address.fixed_format = Id3global::FixedAddress.new()
    uk_data.current_address.fixed_format.premise = "44"
    # uk_data.current_address.fixed_format.sub_street = ""
    uk_data.current_address.fixed_format.street = "Cherry Tree Road"
    uk_data.current_address.fixed_format.city = "Wirral"
    uk_data.current_address.fixed_format.postcode = "CH4 69RF"

    result = Id3global::AuthenticateSp.process(personal_data, uk_data)
  
    result.band_text.should == "PASS"
  
  end

  # THIS CURRENTLY FAILS DUE TO A BUG IN THE ID3 GLOBAL SYSTEM
  # it "should authenticate with free format address" do
  #   configure_id3_for_test
  #   
  #   personal_data = Id3global::PersonalData.new()
  #   personal_data.title = "Mr"
  #   personal_data.forename = "Christopher"
  #   personal_data.surname = "Norman"
  #   personal_data.dob = Date.new(1977,9,1)
  #   personal_data.email = "chris@norman.me"
  # 
  #   uk_data = Id3global::Addresses.new()
  #   uk_data.current_address = Id3global::Address.new()
  #    
  #   uk_data.current_address.free_format = Id3global::FreeAddress.new()
  #   uk_data.current_address.free_format.line_1 = "7 Park Mews"
  #   uk_data.current_address.free_format.line_2 = "Park Road"
  #   uk_data.current_address.free_format.line_3 = "London"
  #   uk_data.current_address.free_format.line_4 = "N8 8GB"
  # 
  #   result = Id3global::AuthenticateSp.process(personal_data, uk_data)
  #   
  #   result.band_text.should == "3. PASS - Full KYC"
  #   
  # end
end


def configure_id3_for_test(log_level = :warn)
  # Id3global.configure do |config|
  #   config.account_name = 'Integration@vamagaming.com'
  #   config.password = 'fHD=2]zes/{GPEB4b/q7ehm8Deiv9m'
  #   config.profile_id = '1de3b997-9d17-4d9c-bb3d-130e652ccec3'
  #   config.profile_version = 2
  #   config.test_mode = true
  #   config.savon_log_level = log_level
  # end
  # 
  Id3global.configure do |config|
    config.account_name = ENV['ID3GLOBAL_ACCOUNT_NAME']
    config.password = ENV['ID3GLOBAL_PASSWORD']
    config.profile_id = ENV['ID3GLOBAL_PROFILE_ID']
    config.profile_version = 0
    config.test_mode = true
    config.savon_log_level = :warn
  end
end
