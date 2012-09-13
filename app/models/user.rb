class User < ActiveRecord::Base
  validates_presence_of :username
  validates_uniqueness_of :username, :email
  before_save :reset_authentication_token
  # Include default devise modules. Others available are:
  #:token_authenticatable, :confirmable,
  #:lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :authentication_token
  # attr_accessible :title, :body
end
