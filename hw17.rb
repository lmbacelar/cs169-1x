class CartesianProduct
  include Enumerable

  def initialize(a,b)
    @a, @b = a, b
  end

  def each(&block)
    @a.product(@b).each(&block)
  end
end
