var players = {
  init: function() {
    $('.library li').on('tap', function() {
      var that = this;
      $(this).addClass('hover');
      setTimeout(function() {
        $(that).removeClass('hover');
      }, 500);
    });
    $('.library li').click(function() {
      var that = this;
      $(this).addClass('hover');
      setTimeout(function() {
        $(that).removeClass('hover');
      }, 300);
    });
  }
};
