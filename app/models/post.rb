class Post < ActiveRecord::Base
  validates_presence_of :title, :content

  has_many :comments
  has_many :tags

end
