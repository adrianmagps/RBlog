class Post < ActiveRecord::Base
  validates_presence_of :title, :content

  has_many :comments

  belongs_to :user
  validates_presence_of :user

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags

end
