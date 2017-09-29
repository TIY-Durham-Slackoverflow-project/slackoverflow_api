class Question < ApplicationRecord
  serialize :tags, Array
  belongs_to :user
  has_many :answers
  has_many :votes

  validates_presence_of :title, :body
end
