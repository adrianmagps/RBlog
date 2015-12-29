class User < ActiveRecord::Base
  belongs_to :role
  # validates_presence_of :role
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: "subscriber" if self.role.nil?
  end
end
