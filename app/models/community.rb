class Community < ApplicationRecord
    belongs_to :user
    has_many :posts
    has_many :subscriptions
    has_many :subscribers, through: :subscriptions, source: :user
    validates_presence_of :name, :rules
    validates_length_of :name, :maximum => 50
    validates_length_of :summary, :maximum => 100
    validates_length_of :rules, :maximum => 100


end
