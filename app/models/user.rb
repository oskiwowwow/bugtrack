class User < ActiveRecord::Base
  #todo: clean this up, add validation, ability to create users
  
  
  belongs_to :person
  
  attr_accessor :password
  before_save :encrypt_password
  
  #validates_confirmation_of :password
  
  def encrypt_password
    if password.present?
      self.password_hash = BCrypt::Password.create(password)
    end
  end
  
  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && BCrypt::Password.new(user.password_hash) == password
      user
    end
  end
end
