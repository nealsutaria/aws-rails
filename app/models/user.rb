class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include EmailValidatable

  include ActiveModel::Validations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :records, dependent: :destroy
  # validates_strength_of :password, :with => :email, :level => :good
  # validates :password, format: { with: /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/, message: "must include at least one lowercase letter, one uppercase letter, one digit, and one special character" }
PASSWORD_FORMAT = /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  (?=.*[[:^alnum:]]) # Must contain a symbol
/x

validates :password,
  presence: true,
  length: { in: Devise.password_length, message: "must include at least one lowercase letter, one uppercase letter, one digit, one special character " },
  format: { with: PASSWORD_FORMAT },
  confirmation: true,
  # message: "must include at least one lowercase letter, one uppercase letter, one digit, and one special character",
  on: :create

validates :password,
  allow_nil: true,
  length: { in: Devise.password_length, message: "must include at least one lowercase letter, one uppercase letter, one digit,one special character"},
  format: { with: PASSWORD_FORMAT },
  confirmation: true,
  on: :update

validates :email, email: true

end
