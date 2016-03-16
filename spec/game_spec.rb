require 'game'

describe Game  do
  subject(:game) { described_class.new player }
  let(:player) { double :player }
  it 'reduces hit points' do
    expect(player).to receive(:receive_damage)
    subject.attack(player)
  end
end
