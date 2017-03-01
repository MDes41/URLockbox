require 'rails_helper'


describe 'Top Ten' do
  context 'When request is made to api/v1/reads' do
    it 'returns top ten' do

      top_ten = TopRanking.new.get_top_ten

      expect(top_ten).to be_kind_of(Array)
      expect(top_ten.first).to have_key(:url)
      expect(top_ten.first).to have_key(:count)
    end
  end
end