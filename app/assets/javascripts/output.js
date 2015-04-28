var output= {
  init: function() {
    var that = this;
    this.hide();
    this.getOutput().click(function() {
      that.slideUp();
    });
    this.getOutput().on('tap', function() {
      that.slideUp();
    });
  },
  getOutput: function() {
    return $('#output');
  },
  show: function() {
    this.getOutput().show();
  },
  hide: function() {
    this.getOutput().hide();
  },
  slideUp: function() {
    this.getOutput().slideUp(300);
  },
  slideDown: function() {
    this.getOutput().slideDown(300);
  }
}
