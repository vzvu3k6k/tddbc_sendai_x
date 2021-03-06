RSpec.describe Strawberry do
  describe '#initialize' do
    context '成功' do
      it 'いちごを作成できる' do
        expect(Strawberry.new('あまおう', 'M')).to be_a(Strawberry)
      end

      it '重さからいちごを作成できる' do
        expect(Strawberry.new('あまおう', 8)).to be_a(Strawberry)
      end
    end

    context '失敗' do
      context '無効な品種の場合' do
        it 'ArgumentError（無効な品種です）が発生する' do
          expect { Strawberry.new('無効な品種', 'M') }.to raise_error ArgumentError, '無効な品種です'
        end
      end

      context '無効なサイズの場合' do
        it 'ArgumentError（無効なサイズです）が発生する' do
          expect { Strawberry.new('あまおう', '無効なサイズ') }.to raise_error ArgumentError, '無効なサイズです'
        end
      end
    end
  end

  describe '#to_s' do
    subject { Strawberry.new(variety, size).to_s }

    describe 'サイズを与えて作成したいちご' do
      describe 'あまおう: M' do
        let(:variety) { 'あまおう' }
        let(:size) { 'M' }
        it { is_expected.to eq 'あまおう: M' }
      end

      describe 'とちおとめ: L' do
        let(:variety) { 'とちおとめ' }
        let(:size) { 'L' }
        it { is_expected.to eq 'とちおとめ: L' }
      end
    end

    describe '重さを与えて作成したいちご' do
      shared_examples '重さから作成したいちご' do |weight, size|
        it { expect(Strawberry.new('とちおとめ', weight).to_s).to eq "とちおとめ: #{size}" }
      end

      context 'S' do
        context('重さが9グラムの場合') { it_should_behave_like '重さから作成したいちご', 9, 'S' }
      end
      context 'M' do
        context('重さが10グラムの場合') { it_should_behave_like '重さから作成したいちご', 10, 'M' }
        context('重さが19グラムの場合') { it_should_behave_like '重さから作成したいちご', 19, 'M' }
      end
      context 'L' do
        context('重さが20グラムの場合') { it_should_behave_like '重さから作成したいちご', 20, 'L' }
        context('重さが24グラムの場合') { it_should_behave_like '重さから作成したいちご', 24, 'L' }
      end
      context 'LL' do
        context('重さが25グラムの場合') { it_should_behave_like '重さから作成したいちご', 25, 'LL' }
      end
    end
  end

  describe '#same_variety?' do
    shared_examples '同一品種判定' do |one_variety, another_variety, expected|
      def any_size
        Strawberry::AVAILABLE_SIZES.sample
      end
      let(:one) { Strawberry.new(one_variety, any_size) }
      let(:another) { Strawberry.new(another_variety, any_size) }

      it { expect(one.same_variety?(another)).to eq expected }
    end

    context('あまおう, あまおう') { it_should_behave_like '同一品種判定', 'あまおう', 'あまおう', true }
    context('あまおう, とちおとめ') { it_should_behave_like '同一品種判定', 'あまおう', 'とちおとめ', false }
    context('あまおう, もういっこ') { it_should_behave_like '同一品種判定', 'あまおう', 'もういっこ', false }
    context('とちおとめ, あまおう') { it_should_behave_like '同一品種判定', 'とちおとめ', 'あまおう', false }
    context('とちおとめ, とちおとめ') { it_should_behave_like '同一品種判定', 'とちおとめ', 'とちおとめ', true }
    context('とちおとめ, もういっこ') { it_should_behave_like '同一品種判定', 'とちおとめ', 'もういっこ', false }
    context('もういっこ, あまおう') { it_should_behave_like '同一品種判定', 'もういっこ', 'あまおう', false }
    context('もういっこ, とちおとめ') { it_should_behave_like '同一品種判定', 'もういっこ', 'とちおとめ', false }
    context('もういっこ, もういっこ') { it_should_behave_like '同一品種判定', 'もういっこ', 'もういっこ', true }
  end

  describe '#size_diff' do
    shared_examples 'サイズ差計算' do |one_size, another_size, expected|
      def any_variety
        Strawberry::AVAILABLE_VARIETIES.sample
      end
      let(:one) { Strawberry.new(any_variety, one_size) }
      let(:another) { Strawberry.new(any_variety, another_size) }

      it { expect(one.size_diff(another)).to eq expected }
    end

    context('S, S') { it_should_behave_like 'サイズ差計算', 'S', 'S', 0 }
    context('S, M') { it_should_behave_like 'サイズ差計算', 'S', 'M', 1 }
    context('S, L') { it_should_behave_like 'サイズ差計算', 'S', 'L', 2 }
    context('S, LL') { it_should_behave_like 'サイズ差計算', 'S', 'LL', 3 }

    context('M, S') { it_should_behave_like 'サイズ差計算', 'M', 'S', 1 }
    context('M, M') { it_should_behave_like 'サイズ差計算', 'M', 'M', 0 }
    context('M, L') { it_should_behave_like 'サイズ差計算', 'M', 'L', 1 }
    context('M, LL') { it_should_behave_like 'サイズ差計算', 'M', 'LL', 2 }

    context('L, S') { it_should_behave_like 'サイズ差計算', 'L', 'S', 2 }
    context('L, M') { it_should_behave_like 'サイズ差計算', 'L', 'M', 1 }
    context('L, L') { it_should_behave_like 'サイズ差計算', 'L', 'L', 0 }
    context('L, LL') { it_should_behave_like 'サイズ差計算', 'L', 'LL', 1 }

    context('LL, S') { it_should_behave_like 'サイズ差計算', 'LL', 'S', 3 }
    context('LL, M') { it_should_behave_like 'サイズ差計算', 'LL', 'M', 2 }
    context('LL, L') { it_should_behave_like 'サイズ差計算', 'LL', 'L', 1 }
    context('LL, LL') { it_should_behave_like 'サイズ差計算', 'LL', 'LL', 0 }
  end
end