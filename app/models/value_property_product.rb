class ValuePropertyProduct < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to	:property
  belongs_to	:product
end
