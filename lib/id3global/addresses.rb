class Id3global::Addresses
  attr_accessor :current_address, :previous_address1, :previous_address2, :previous_address3
  
  def to_prove_hash
    return_hash = {}
    
    return_hash = return_hash.merge!({"CurrentAddress" => self.current_address.to_prove_hash}) unless self.current_address.nil?
    return_hash = return_hash.merge!({"PreviousAddress1" => self.previous_address1.to_prove_hash}) unless self.previous_address1.nil?
    return_hash = return_hash.merge!({"PreviousAddress2" => self.previous_address2.to_prove_hash}) unless self.previous_address2.nil?
    return_hash = return_hash.merge!({"PreviousAddress3" => self.previous_address3.to_prove_hash}) unless self.previous_address3.nil?
    
    return_hash
  end
  
end