class Strawberry
  def initialize(variety, size)
    @variety = variety
    @size = size
  end

  def to_s
    "#{@variety}: #{@size}"
  end
end