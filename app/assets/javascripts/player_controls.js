var playerControls = {
  init: function() {
    $('.icon').click(function() {
      var that = this;
      $(this).addClass('icon_hover');
      setTimeout(function() {
        $(that).removeClass('icon_hover');
      }, 500);
    });
    $('.icon').on('tap', function() {
      var that = this;
      $(this).addClass('icon_hover');
      setTimeout(function() {
        $(that).removeClass('icon_hover');
      }, 500);
    });
  }
};
