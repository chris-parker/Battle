require 'game'

describe Game do

  let(:player_1) { double :player_1, name: "player_1", paralyzed?: false }
  let(:player_2) { double :player_2, name: "player_2", paralyzed?: false }

  before(:each) do
    Game.start(player_1, player_2)
  end

  it "starts a game with two players" do
    expect(Game.player_1).to eq player_1
    expect(Game.player_2).to eq player_2
  end

  context "attacking" do
    it "calls reduce_hp on an attacked player" do
      expect(player_2).to receive(:attack).with("heavy")
      Game.attack("heavy")
    end

    it 'switches players array to put current player last' do
      expect(player_2).to receive(:attack).with("heavy")
      allow(player_1).to receive(:attack).with("heavy")
      2.times { Game.attack("heavy") }
    end

  end

end
