require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject { build(:movie) }

  describe "validation" do
    it { is_expected.to validate_presence_of(:youtube_url) }
  end

  describe "relationships" do
    it { is_expected.to belong_to :user }
  end
end
