require 'player'


describe Player do

  subject(:test_player) { described_class.new('test_player') }

  describe '#initialize' do
    it { is_expected.to respond_to :name }

    it 'expects each player to have an HP attribute' do
      expect(subject.hp_check).to eq(subject.hp)
    end

  end

  describe '#attack' do
    it 'expects Attack! to reduce opponent\'s HP' do
      expect{ subject.reduce_hp }.to change { subject.hp }.by_at_most(-1)
    end

    it 'expects a player to die when reaching 0HP' do
      5.times { subject.reduce_hp }
      expect(subject.dead?).to be true
    end

  end

end
