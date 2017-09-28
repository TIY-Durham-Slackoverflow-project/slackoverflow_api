class Question < ApplicationRecord
  serialize :tags, Array
  belongs_to :user
  has_many :answers

  validates_presence_of :title, :body
end
