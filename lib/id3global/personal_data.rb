class Id3global::PersonalData
  attr_accessor :title, :forename, :middlename, :surname, :gender, :dob, :email, :landline, :mobile

  def to_prove_hash


    contact_details = Hash.new
    land_phone = Hash.new

    if landline.nil?
      land_phone["ExDirectory"] = true
    else
      land_phone["ExDirectory"] = false
      land_phone["Number"] = landline
    end

    contact_details["LandTelephone"] = land_phone

    contact_details["MobileTelephone"] = {
      "Number" => self.mobile
    } unless self.mobile.nil?

    contact_details["Email"] = self.email unless email.nil?

    {
      "Personal" =>{
        "PersonalDetails" => {
          "Title" => self.title,
          "Forename" => self.forename,
          "MiddleName" => self.middlename,
          "Surname" => self.surname,
          "Gender" => self.gender.blank? ? "Unknown" : self.gender,
          "DOBDay" => self.dob.blank? ? "" : self.dob.day,
          "DOBMonth" => self.dob.blank? ? "" : self.dob.month,
          "DOBYear" => self.dob.blank? ? "" : self.dob.year
        }
      },
      "ContactDetails" => contact_details
    }
  end

end
