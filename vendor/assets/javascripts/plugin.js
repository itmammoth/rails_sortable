(function($) {

  $.fn.railsSortable = function(options) {
    var defaults = {
      axis: 'y',
      scroll: 'true'
    };

    var setting = $.extend(defaults, options);
    setting["update"] = function() {
      $.post("/sortable/reorder", $(this).sortable('serialize'))
    }

    this.sortable(setting);
  };

})(jQuery);