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
    var data = $.map($sortable.sortable('toArray'), function(sortableId) {
      klassAndId = sortableId.split(/[-=_]/);
      return { klass: klassAndId[0], id: klassAndId[1] };
    });
    return { rails_sortable: data };
  };
})(jQuery);