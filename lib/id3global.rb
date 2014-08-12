require "id3global/version"

require 'savon'

module Id3global
  autoload :AuthenticateSp,         'id3global/authenticate_sp'
  autoload :AuthenticationResult,   'id3global/authentication_result'
  autoload :ProfileList,            'id3global/profile_list'
  autoload :Profile,                'id3global/profile'
  autoload :FreeAddress,            'id3global/free_address'
  autoload :FixedAddress,           'id3global/fixed_address'
  autoload :Address,                'id3global/address'
  autoload :Addresses,              'id3global/addresses'
  autoload :PersonalData,           'id3global/personal_data'


  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :current_version, :test_mode, :account_name, :password, :profile_id, :profile_version, :savon_log_level

    def initialize
      @current_version = "12b"
      @test_mode = false
      @account_name = nil
      @password = nil
      @profile_version = 1
      @savon_log_level = :fatal
    end
  end

  TEST_BASE_URL = "https://pilot.id3global.com/"
  LIVE_BASE_URL = "https://www.id3global.com/"

  PROVE_SERVICE_ROOT = "GlobalWS"

  def self.setup
    yield self
  end

  def self.get_service_wsdl
    root = Id3global.configuration.test_mode ?  TEST_BASE_URL : LIVE_BASE_URL
    "#{root}#{PROVE_SERVICE_ROOT}/Global#{Id3global.configuration.current_version}.asmx?wsdl"
  end

  def self.create_client
    client = Savon.client(log_level: Id3global.configuration.savon_log_level,
                          wsdl: self.get_service_wsdl) do
      HTTPI.log = Id3global.configuration.savon_log_level == :debug
    end


  end

  def self.merge_password_hash(options = {})
    raise "ID3 Global Account Name and/or Password Have Not Been Set" if Id3global.configuration.account_name.nil? || Id3global.configuration.password.nil?

    password_hash = {
      "AccountName" => Id3global.configuration.account_name,
      "Password" => Id3global.configuration.password
    }

    options.merge!(password_hash)
  end

end
