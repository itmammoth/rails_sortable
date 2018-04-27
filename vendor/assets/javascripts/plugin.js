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

      $.ajax({
        type: 'POST',
        url: '/sortable/reorder',
        dataType: 'json',
        contentType: 'application/json',
        data: JSON.stringify(makePostData($(this))),
      });
    }

    this.sortable(setting);
  };

  var makePostData = function($sortable) {
    var klass, id;
    var data = $.map($sortable.sortable('toArray'), function(sortableId) {
      [klass, id] = sortableId.split(/[-=_]/);
      return { klass: klass, id: id };
    });
    return { rails_sortable: data };
  };
})(jQuery);