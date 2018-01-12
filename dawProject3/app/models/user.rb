require 'digest'
class User < ApplicationRecord
  mount_uploader :profile_pic, ProfilePicUploader
	attr_accessor :password
  before_save :encrypt_new_password
	after_create :build_profile	
	has_one :profile, dependent: :destroy
	has_many :trips, dependent: :destroy
	has_many :comments, through: :trips, source: :comments, dependent: :destroy
	has_many :posts, through: :trips, source: :posts, dependent: :nullify
	
  	scope :recent_comments, ->{where("comments.created_at > ? AND user_id = ?", [6.months.ago, self.id]).limit(3)}
	#friends
	has_many :users

    scope :some_friends, ->{users.limit(3)}

	validates :email, uniqueness: {case_sensitive: false, message: 'El correo debe ser único'}, length: {in: 6..50, too_short: "debe tener al menos %{count} caracteres"}, format: {multiline: true,with: /^.+@.+$/, message: "formato de correo no valido"}

  	validates :password, confirmation: true, length: {within: 4..20}, presence: {if: :password_required?}
	validates :password_confirmation, presence: true
	
  def self.authenticate(email,password)
    user = find_by_email(email)
    return user if user && user.authenticated?(password)
  end
  
  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end
  
  protected
  def encrypt_new_password
    return if password.blank?
    self.hashed_password = encrypt(password)
  end
  def password_required?
    hashed_password.blank? || password.present?
  end
  def encrypt(string)
    Digest::SHA1.hexdigest(string) 
  end
  def build_profile
	Profile.create(user: self, name: self.name, bio:"Im using Tripper!")  
  end
end
