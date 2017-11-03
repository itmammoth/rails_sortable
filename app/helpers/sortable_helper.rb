module SortableHelper
  def sortable_fetch(models, &block)
    warn "[DEPRECATION] `sortable_fetch` is deprecated. Please use Enumerable#each_with_sortable_id instead."
    raise "Must be called with block!" unless block_given?
    models.each_with_sortable_id(&block)
  end
end
