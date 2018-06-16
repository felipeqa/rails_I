require 'bcrypt'

class Company < ApplicationRecord
  attr_protected :encrypted_password
  def password=(new_password)
    @password = new_password
    self.encrypted_password = BCrypt::Password.create(@password)
  end

  def password
    @password
  end
end
