class Strawberry
  AVAILABLE_VARIETIES = ['あまおう', 'とちおとめ', 'もういっこ']
  AVAILABLE_SIZES = ['S', 'M', 'L', 'LL']

  attr_reader :variety, :size

  def initialize(variety, size)
    raise ArgumentError, '無効な品種です' unless AVAILABLE_VARIETIES.include?(variety)
    if size.is_a?(Integer)
      size = weight_to_size(size)
    else
      raise ArgumentError, '無効なサイズです' unless AVAILABLE_SIZES.include?(size)
    end

    @variety = variety
    @size = size
  end

  def to_s
    "#{@variety}: #{@size}"
  end

  def same_variety?(another)
    self.variety == another.variety
  end

  def size_diff(another)
    (AVAILABLE_SIZES.index(another.size) - AVAILABLE_SIZES.index(self.size)).abs
  end

  private

  def weight_to_size(weight)
    if weight < 10
      'S'
    elsif weight < 20
      'M'
    elsif weight < 25
      'L'
    else
      'LL'
    end
  end
end