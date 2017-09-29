class Question < ApplicationRecord
  serialize :tags, Array
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates_presence_of :title, :body
end
