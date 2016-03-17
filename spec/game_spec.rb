require 'game'

describe Game do

  subject(:new_game) { described_class.new(player1, player2) }
  let(:player1) { double :player }
  let(:player2) { double :player }

  it "starts a game with two players" do
    expect(subject.players).to eq [player1, player2]
  end

  context "attacking" do
    it "calls reduce_hp on an attacked player" do
      allow(player1).to receive(:reduce_hp)
      subject.attack(player1)
      expect(player1).to have_received(:reduce_hp)
    end
  end

end
