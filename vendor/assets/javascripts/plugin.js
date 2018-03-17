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
      $.post("/sortable/reorder", $(this).sortable('serialize'));
    }

    this.sortable(setting);
  };

})(jQuery);