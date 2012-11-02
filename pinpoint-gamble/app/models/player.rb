class Player < ActiveRecord::Base
  has_many :games, :through => :broadcasts
  has_many :devices
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :username, :password_confirmation, :remember_me, :token_authenticatable, :guest
  # attr_accessible :title, :body
end
