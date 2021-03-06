class User < ActiveRecord::Base
  MEDIA_TYPES = %w(videos music books)

  attr_accessible :name, :surname_1, :surname_2, :nick, :password, :password_confirmation, :birthday, :email
  attr_accessor :password, :password_confirmation
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  # VALIDATIONS
  validates :name, :presence => true,
    :length => { minimum: 3, maximum: 75 }
  validates :nick, :presence => true,
    :length => { maximum: 25 }
  validates :email, :presence => true, 
    :format => { with: email_regex },
    :uniqueness => { case_sensitive: false }
  validates :password, :presence => true,
    :confirmation => true
  
  # TRANSACTIONS
  before_save :encrypt_password
  
  # RELATIONSHIPS
  has_many :videos
  has_many :music
  has_many :books
  
  # CLASS METHODS
  def self.authenticate(nick_email, submitted_password)
    user = find_by_nick(nick_email) or find_by_email(nick_email)
    return nil if user.nil?
    logger.debug "submitted_password: #{submitted_password}"
    logger.debug "user.has_password?(submitted_password): #{user.has_password?(submitted_password)}"
    return user if user.has_password?(submitted_password)
  end

  # INSTANCE METHODS
  MEDIA_TYPES.each do |type|
    define_method "#{type}?" do
      send(type).empty?
    end
  end

  MEDIA_TYPES.each do |type|
    define_method "last_#{type}" do |total = 5|
      send(type).all limit: total, order: 'created_at DESC'
    end
  end

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
    
  def movies
    videos
  end
  
  private

    def encrypt_password  
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  surname_1  :string(255)
#  surname_2  :string(255)
#  nick       :string(255)
#  password   :string(255)
#  birthday   :date
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

