class Answer < ApplicationRecord
  belongs_to :question
  has_many :answersusers, dependent: :destroy
end
