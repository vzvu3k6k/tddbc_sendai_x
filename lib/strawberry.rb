class Strawberry
  AVAILABLE_VARIETIES = ['あまおう', 'とちおとめ', 'もういっこ']
  AVAILABLE_SIZES = ['S', 'M', 'L', 'LL']

  def initialize(variety, size)
    raise ArgumentError, '無効な品種です' unless AVAILABLE_VARIETIES.include?(variety)
    unless size.is_a?(Integer)
      raise ArgumentError, '無効なサイズです' unless AVAILABLE_SIZES.include?(size)
    end

    @variety = variety
    @size = size
  end

  def to_s
    "#{@variety}: #{@size}"
  end
end