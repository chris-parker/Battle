require 'game'

describe Game do

  let(:player_1) { double :player_1, name: "player_1" }
  let(:player_2) { double :player_2, name: "player_2" }

  before(:each) do
    Game.start(player_1, player_2)
  end

  it "starts a game with two players" do
    expect(Game.player_1).to eq player_1
    expect(Game.player_2).to eq player_2
  end

  context "attacking" do
    it "calls reduce_hp on an attacked player" do
      expect(player_2).to receive(:reduce_hp)
      Game.attack
    end

    it 'switches players array to put current player last' do
      expect(player_2).to receive(:reduce_hp)
      allow(player_1).to receive(:reduce_hp)
      2.times { Game.attack }
    end

  end

end
