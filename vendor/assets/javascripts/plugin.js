(function($) {

  $.fn.railsSortable = function(options) {
    options = options || {};
    var settings = $.extend({}, options);
    
    settings.baseUrl = settings.baseUrl || '';

    settings.update = function(event, ui) {
      if (typeof options.update === 'function') {
        options.update(event, ui);
      }

      $.ajax({
        type: 'POST',
        url: settings.baseUrl + '/sortable/reorder',
        dataType: 'json',
        contentType: 'application/json',
        data: JSON.stringify({
          rails_sortable: $(this).sortable('toArray'),
        }),
      });
    }

    this.sortable(settings);
  };
})(jQuery);
