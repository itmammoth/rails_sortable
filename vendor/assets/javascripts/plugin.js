(function($) {

  $.fn.railsSortable = function(options) {
    options = options || {};
    var setting = $.extend({
      axis: 'y',
      scroll: 'true',
    }, options);

    setting.update = function(event, ui) {
      if (typeof options.update === 'function') {
        options.update(event, ui);
      }
      $.post("/sortable/reorder", makePostData($(this)));
    }

    this.sortable(setting);
  };

  var makePostData = function($sortable) {
    var data = {}, klass, id;
    $sortable.sortable('toArray').forEach(function(sortableId) {
      [klass, id] = sortableId.split(/[-=_]/);
      (data[klass] || (data[klass] = [])).push(id);
    });
    return { rails_sortable: data };
  };
})(jQuery);