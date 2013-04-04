class Id3global::FreeAddress
  attr_accessor :line_1, :line_2, :line_3, :line_4, :line_5, :line_6, :line_7, :line_8, :postcode, :country
  
  def to_prove_hash
    {
      "AddressLine1" => self.line_1,
      "AddressLine2" => self.line_2,
      "AddressLine3" => self.line_3,
      "AddressLine4" => self.line_4,
      "AddressLine5" => self.line_5,
      "AddressLine6" => self.line_6,
      "AddressLine7" => self.line_7,
      "AddressLine8" => self.line_8,
      "Country" => self.country.nil? ? "United Kingdom" : self.country
    }
  end
  
end




