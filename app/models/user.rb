class User < ActiveRecord::Base
  #register inline callback after the before_save callback
  before_save { self.email = email.downcase if email.present? }
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  #first validation for new user
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  #second validation allows password to stay same when updating other parts of user
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }
  has_secure_password
end
