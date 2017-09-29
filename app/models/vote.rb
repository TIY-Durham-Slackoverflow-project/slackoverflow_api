class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :answer

  validates_uniqueness_of :question, scope: :user
  validates_uniqueness_of :answer, scope: :user
end
