class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
  validates	 :name,	:body,		:presence  => true
  belongs_to :commentable, polymorphic: true
end
