require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:password_confirmation) }
  it { should validate_uniqueness_of(:email) }
end
