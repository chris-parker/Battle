require 'game'

describe Game do

  subject(:new_game) { described_class.new(player1, player2) }
  let(:player1) { double :player1 }
  let(:player2) { double :player2 }

  it "starts a game with two players" do
    expect(subject.players).to eq [player1, player2]
  end

  context "attacking" do
    it "calls reduce_hp on an attacked player" do
      allow(player2).to receive(:reduce_hp)
      subject.attack
      expect(player2).to have_received(:reduce_hp)
    end

    it 'switches players array to put current player last' do
      allow(player2).to receive(:reduce_hp)
      subject.attack
      expect(subject.player_swap.last).to eq(player1)
    end

  end

end
