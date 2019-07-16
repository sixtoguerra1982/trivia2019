class Answersuser < ApplicationRecord
  belongs_to :users
  belongs_to :answers
end
