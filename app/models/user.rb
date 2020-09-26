class User < ApplicationRecord
  # model association
  has_many :tweets, dependent: :destroy

  # validations
  validates_presence_of :username, :name, :avatar
end
