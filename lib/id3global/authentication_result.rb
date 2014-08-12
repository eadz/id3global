
class Id3global::AuthenticationResult
  ATTRIBUTES = [
    :authentication_id, :timestamp, :no_retry, :user_breakpoint, :authentication_count,
    :profile_id, :profile_name, :profile_version, :profile_revision, :profile_state,
    :result_codes, :score, :band_text
  ].freeze

  ATTRIBUTES.each do |attr|
    attr_accessor attr
  end

  def initialize(args = nil)
    ATTRIBUTES.each do |a|
      if (args.key?(a))
        instance_variable_set("@#{a}", args[a])
      end
    end
  end

  def inspect
    ATTRIBUTES.inject({ }) do |h, attr|
      h[attr] = instance_variable_get("@#{attr}")
      h
    end
  end

end
