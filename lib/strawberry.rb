class Strawberry
  AVAILABLE_VARIETIES = ['あまおう', 'とちおとめ', 'もういっこ']
  AVAILABLE_SIZES = ['S', 'M', 'L', 'LL']

  def initialize(variety, size)
    unless AVAILABLE_VARIETIES.include?(variety)
      raise ArgumentError, '無効な品種です'
    end
    unless AVAILABLE_SIZES.include?(size)
      raise ArgumentError, '無効なサイズです'
    end

    @variety = variety
    @size = size
  end

  def to_s
    "#{@variety}: #{@size}"
  end
end