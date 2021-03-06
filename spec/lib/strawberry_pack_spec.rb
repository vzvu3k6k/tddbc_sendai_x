RSpec.describe StrawberryPack do
  describe '#initialize' do
    let(:strawberry1) { Strawberry.new('あまおう', 'S') }
    let(:strawberry2) { Strawberry.new('あまおう', 'S') }
    let(:strawberry3) { Strawberry.new('あまおう', 'S') }

    it 'いちごパックを作成できる' do
      strawberries = [strawberry1, strawberry2, strawberry3]
      expect(StrawberryPack.new(strawberries)).to be_a(StrawberryPack)
    end
  end

  describe '#same_variety?' do
    let(:strawberries) { [strawberry1, strawberry2, strawberry3] }
    let(:pack) { StrawberryPack.new(strawberries) }

    def any_size
      Strawberry::AVAILABLE_SIZES.sample
    end

    context 'いちごの品種がすべて同じ場合' do
      let(:strawberry1) { Strawberry.new('あまおう', any_size) }
      let(:strawberry2) { Strawberry.new('あまおう', any_size) }
      let(:strawberry3) { Strawberry.new('あまおう', any_size) }

      it '純粋だと判定する' do
        expect(pack).to be_same_variety
      end
    end

    context 'いちごの品種が2つだけ同じ場合' do
      let(:strawberry1) { Strawberry.new('あまおう', any_size) }
      let(:strawberry2) { Strawberry.new('あまおう', any_size) }
      let(:strawberry3) { Strawberry.new('とちおとめ', any_size) }

      let(:pack) { StrawberryPack.new(strawberries) }
      it '純粋ではないと判定する' do
        expect(pack).not_to be_same_variety
      end
    end

    context 'いちごの品種がすべて異なる場合' do
      let(:strawberry1) { Strawberry.new('あまおう', any_size) }
      let(:strawberry2) { Strawberry.new('とちおとめ', any_size) }
      let(:strawberry3) { Strawberry.new('もういっこ', any_size) }

      let(:pack) { StrawberryPack.new(strawberries) }
      it '純粋ではないと判定する' do
        expect(pack).not_to be_same_variety
      end
    end
  end
end
