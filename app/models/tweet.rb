class Tweet < ApplicationRecord
  # model association
    belongs_to :user

    #validation
    validates_presence_of :text

end
