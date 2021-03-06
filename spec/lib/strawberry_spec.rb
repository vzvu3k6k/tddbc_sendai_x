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
end