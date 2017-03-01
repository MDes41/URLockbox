require 'rails_helper'

RSpec.describe Link, type: :model do
  it 'clears the current rank' do
    user = create :user
    link = create :link, user: user, rank: 'Top'
    
    link.clear_rank

    expect(link.rank).to eq('')
  end

end
