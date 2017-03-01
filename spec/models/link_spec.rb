require 'rails_helper'

RSpec.describe Link, type: :model do
  it 'clears the current rank' do
    user = create :user
    link = create :link, user: user, rank: 'Top'
    
    link.clear_rank

    expect(link.rank).to eq('')
  end

  it 'sorts the links according to their id' do 
    user = create :user
    10.times do 
      create :link, user: user
    end

    links = Link.sort
    expect(links.first.id).to eq(2)
    expect(links[2].id).to eq(4)
    expect(links.last.id).to eq(11)
  end

  it 'validates good url' do
    expect(Link.create(url: 'www.turing.io', title: 'turing')).to_not be_valid
  end

  it 'validates bad url' do 
    create :link, url: 'https://www.turing.io'

    expect(Link.count).to eq(1)
  end

  it 'validates without title' do 
    expect(Link.create(url: 'www.turing.io', title: '')).to_not be_valid
  end

  it 'validates with title' do 
    create :link, url: 'https://www.turing.io', title: 'Turing'

    expect(Link.count).to eq(1)
  end

  

end
