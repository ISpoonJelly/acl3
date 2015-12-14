class User < ActiveRecord::Base
  # Fields
  attr_accessor :password
  
  # Validations
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true, on: :create
  
  # Relations
  has_many :posts
  has_many :comments
  has_many :messages
  has_many :followed, :class_name => "User"
  
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