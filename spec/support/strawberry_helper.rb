module StrawberryHelper
  module_function

  def any_variety
    Strawberry::AVAILABLE_VARIETIES.sample
  end

  def any_size
    Strawberry::AVAILABLE_SIZES.sample
  end
end