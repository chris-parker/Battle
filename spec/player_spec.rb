require 'player'


describe Player do

  subject(:test_player) { described_class.new('test_player') }

  describe '#initialize' do
    it { is_expected.to respond_to :name }

    it 'expects each player to have an HP attribute' do
      expect(test_player.hp_check).to eq(test_player.hp)
    end

  end

  describe '#attack' do
    it 'expects Attack! to reduce opponent\'s HP' do
      expect{ test_player.reduce_hp }.to change { test_player.hp }
    end

    it 'expects a player to die when reaching 0HP' do
      allow(Kernel).to receive(:rand).and_return(20)
      5.times { test_player.reduce_hp }
      expect(test_player.dead?).to be true
    end

  end

end
