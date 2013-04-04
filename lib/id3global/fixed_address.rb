class Id3global::FixedAddress
  attr_accessor :country, :postcode, :building, :premise, :sub_building, :company, :street, :sub_street, :city, :region
  
  def to_prove_hash
    {
      "ZipPostcode" => self.postcode, 
      "Building" => self.building, 
      "Premise" => self.premise, 
      "SubBuilding" => self.sub_building, 
      "Company" => self.company, 
      "Street" => self.street, 
      "SubStreet" => self.sub_street, 
      "City" => self.city, 
      "Region" => self.region,
      "Country" => self.country.nil? ? "United Kingdom" : self.country
    }
  end
  
end




