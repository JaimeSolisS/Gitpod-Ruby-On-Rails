require 'rails_helper'

RSpec.describe User, type: :model do
   # Association test
  # ensure User model has a 1:m relationship with the Tweet model
  it { should have_many(:tweets).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:avatar) }
end
