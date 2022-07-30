class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include EmailValidatable

  include ActiveModel::Validations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :records, dependent: :destroy

  has_many :subscriptions
  has_many :communities, through: :subscriptions
  has_many :posts
  has_many :comments
  has_many :votes

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

STATES =
  [
    ['Alabama', 'AL'],
    ['Alaska', 'AK'],
    ['Arizona', 'AZ'],
    ['Arkansas', 'AR'],
    ['California', 'CA'],
    ['Colorado', 'CO'],
    ['Connecticut', 'CT'],
    ['Delaware', 'DE'],
    ['District of Columbia', 'DC'],
    ['Florida', 'FL'],
    ['Georgia', 'GA'],
    ['Hawaii', 'HI'],
    ['Idaho', 'ID'],
    ['Illinois', 'IL'],
    ['Indiana', 'IN'],
    ['Iowa', 'IA'],
    ['Kansas', 'KS'],
    ['Kentucky', 'KY'],
    ['Louisiana', 'LA'],
    ['Maine', 'ME'],
    ['Maryland', 'MD'],
    ['Massachusetts', 'MA'],
    ['Michigan', 'MI'],
    ['Minnesota', 'MN'],
    ['Mississippi', 'MS'],
    ['Missouri', 'MO'],
    ['Montana', 'MT'],
    ['Nebraska', 'NE'],
    ['Nevada', 'NV'],
    ['New Hampshire', 'NH'],
    ['New Jersey', 'NJ'],
    ['New Mexico', 'NM'],
    ['New York', 'NY'],
    ['North Carolina', 'NC'],
    ['North Dakota', 'ND'],
    ['Ohio', 'OH'],
    ['Oklahoma', 'OK'],
    ['Oregon', 'OR'],
    ['Pennsylvania', 'PA'],
    ['Puerto Rico', 'PR'],
    ['Rhode Island', 'RI'],
    ['South Carolina', 'SC'],
    ['South Dakota', 'SD'],
    ['Tennessee', 'TN'],
    ['Texas', 'TX'],
    ['Utah', 'UT'],
    ['Vermont', 'VT'],
    ['Virginia', 'VA'],
    ['Washington', 'WA'],
    ['West Virginia', 'WV'],
    ['Wisconsin', 'WI'],
    ['Wyoming', 'WY']
  ]

def upvoted_post_ids
    self.votes.where(upvote: true).pluck(:post_id)
    # Vote.includes(:account).where(account_id: self.id, upvote: true).pluck(:post_id)
  end

  def downvoted_post_ids
    self.votes.where(upvote: false).pluck(:post_id)
    # Vote.includes(:account).where(account_id: self.id, upvote: false).pluck(:post_id)
  end
end
