require 'game'

describe Game  do
  subject(:game) { described_class.new player_1, player_2 }
  let(:player_1) { double :player_1 }
  let(:player_2) { double :player_2 }

  it 'starts a game with two players' do
    expect(subject.player_1).to be_truthy
  end

  it 'reduces hit points' do
    expect(player_2).to receive(:receive_damage)
    subject.attack(player_2)
  end

end
