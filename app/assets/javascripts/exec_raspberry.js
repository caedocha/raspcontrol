var execRaspberry = {
  init: function() {
    var that = this;
    this.getRaspberries().on('tap', function() {
      var command  = that.getRaspberryCommand($(this));
      that.exec(command);
    });
    this.getRaspberries().click(function() {
      var command  = that.getRaspberryCommand($(this));
      that.exec(command);
    });
  },
  exec: function(command) {
    var that = this;
    $.ajax({
      method: 'GET',
      url: '/raspberries/exec_command',
      data: { command: command, utf: '' },
      type: 'json'
    }).done( function(data) {
      that.displayOutput(data);
    });
  },
  getRaspberries: function() {
    return $('.raspberry');
  },
  getRaspberryCommand: function(raspberry) {
    return raspberry.find('.command').val();
  },
  displayOutput: function(data) {
    console.log(data);
    output.getOutput().html(data);
    output.slideDown();
  }
}
