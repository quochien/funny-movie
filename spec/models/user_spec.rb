require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe "validation" do
    it { is_expected.to validate_presence_of :email }
  end

  describe "relationships" do
    it { is_expected.to have_many :movies }
  end
end
