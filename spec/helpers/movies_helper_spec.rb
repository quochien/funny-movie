require 'rails_helper'

RSpec.describe MoviesHelper, type: :helper do
  describe 'youtube_id' do
    it 'returns youtube id' do
      expect(helper.youtube_id('https://www.youtube.com/watch?v=NhEuAPYm_Ug')).to eq('NhEuAPYm_Ug')
      expect(helper.youtube_id('https://www.youtube.com/watch?v=NhEuAPYm_Ug&list=RDE_RRMRXJWxI&index=17')).to eq('NhEuAPYm_Ug')
      expect(helper.youtube_id('https://www.youtube.com/embed/NhEuAPYm_Ug')).to eq('NhEuAPYm_Ug')
    end

    it 'returns nil' do
      expect(helper.youtube_id('')).to be_nil
      expect(helper.youtube_id('https://www.youtube.com/abcxyz')).to be_nil
    end
  end
end
