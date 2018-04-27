(function($) {
  $(".sortable-items").railsSortable({
    update: function(event, ui) {
        console.log('Yay! RailsSortable never spoil your implementation for sotable events.');
        console.log(event, ui);
    },
  });
})(jQuery);