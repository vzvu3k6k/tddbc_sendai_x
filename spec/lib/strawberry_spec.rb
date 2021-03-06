RSpec.describe Strawberry do
  describe '#initialize' do
    context '成功' do
      it do
        expect(Strawberry.new('あまおう', 'M')).to be_a(Strawberry)
      end
    end

    context '失敗' do
      it do
        expect { Strawberry.new('無効な品種', '無効なサイズ') }.to raise_error ArgumentError
      end
      # なお、品種は、 あまおう とちおとめ もういっこ の3種類、いちごのサイズは S M L LL の4種類です。
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