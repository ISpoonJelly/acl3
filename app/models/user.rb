class User < ActiveRecord::Base
  # Fields
  attr_accessor :password
  
  # Validations
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true, on: :create
  
  # Relations
  has_many :posts
  has_many :comments, foreign_key: 'id'
  has_many :messages, foreign_key: 'id'
  has_many :friendships, foreign_key: 'id'
  has_many :friends, :through => :friendships, foreign_key: 'id'
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user, foreign_key: 'id'
  has_many :follow_posts, foreign_key: 'id'
  has_many :channels, foreign_key: 'id'
  has_many :invite_to_channels, foreign_key: 'id'
  has_many :channel_messages, foreign_key: 'id'
  
  # Callbacks
  before_create -> { self.token = SecureRandom.hex }, unless: :token?
  before_save :encrypt_password, if: -> { self.password.present? }
  
  # Class Methods
  def self.authenticate(email, password)
    user = find_by(email: email)
    if user.present? && user.valid_password?(password)
      user
    else
      User.new.tap do |user|
        user.errors.add :base, 'Invalid email or password'
      end
    end
  end
  
  # Methods
  def valid_password?(password)
    self.encrypted_password == Digest::MD5.hexdigest(password)
  end
  
  def encrypt_password
    self.encrypted_password = Digest::MD5.hexdigest(self.password)
  end
end
