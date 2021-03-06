
class StrawberryPack
  def initialize(strawberries)
    @strawberries = strawberries
  end

  def same_variety?
    @strawberries.each_cons(2).all? { |a, b| a.same_variety?(b) }
  end
end
