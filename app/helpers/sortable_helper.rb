module SortableHelper

  def sortable_fetch(models, &block)
    raise "You must call with block!" unless block_given?
    models.each do |object|
      yield object, "#{object.class}_#{object.id}"
    end
  end
end