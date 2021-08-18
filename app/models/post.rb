class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'sub', primary_key: 'sub', optional: true
  validates_presence_of :sub, :body, :title
end
