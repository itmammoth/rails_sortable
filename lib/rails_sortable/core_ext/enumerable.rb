module Enumerable
  def each_with_sortable_id(&block)
    raise "Must be called with block!" unless block_given?
    each { |e| yield e, e.sortable_id }
  end
end
