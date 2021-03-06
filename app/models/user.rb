class User < ActiveRecord::Base
  has_many :users_roles
  has_many :roles, through: :users_roles

  before_create :create_remember_token
  before_save { self.email = email.downcase }


  validates :name, presence: true, length: {minimum: 3, maximum: 50}

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with:EMAIL_REGEX}, uniqueness: {case_sensitive: true}


  has_secure_password
  validates :password, length: { minimum: 6 }, unless: :skip_password_validation

  attr_accessor :skip_password_validation

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def is_admin?
    self.roles.first.name == 'admin';
  end

  def is_agent?
    self.roles.first.name == 'agent';
  end

  def is_client?
    self.roles.first.name == 'client';
  end

  def is_guest?
    self.roles.first.name == 'guest';
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end


end
