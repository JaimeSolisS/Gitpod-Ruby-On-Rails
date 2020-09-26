require 'rails_helper'

RSpec.describe Tweet, type: :model do
  # Association test
  # ensure a tweet record belongs to a single user record
  it { should belong_to(:user) }
  # Validation test
  # ensure column text is present before saving
  it { should validate_presence_of(:text) }
end
