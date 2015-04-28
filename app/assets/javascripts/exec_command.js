var execCommand = {
  init: function() {
    var that = this;
    output.getOutput().hide();
    that.getCommand().focus();
    that.getCommand().typing({
      start: function(event, $elem) {
        that.lowerCommandsFirstChar();
      },
      delay: 100
    });
    that.getCommand().on('tap', function() {
      that.exec();
    });
    that.getExecute().click(function() {
      that.exec();
    });
  },
  exec: function(){
    var that = this;
    $.ajax({
      method: 'GET',
      url: '/raspberries/exec_command',
      data: { command: that.getCommandVal(), utf: '' },
      type: 'json'
    }).done( function(data) {
      that.displayResult(data);
    });
  },
  displayResult: function(result) {
    output.show();
    output.getOutput().html(result)
  },
  getExecute: function() {
    return $('#execute');
  },
  getCommand: function() {
    return $('#command');
  },
  setCommand: function(val) {
    this.getCommand().val(val);
  },
  getCommandVal: function() {
    return this.getCommand().val();
  },
  lowerCommandsFirstChar: function() {
    this.setCommand(this.lowerFirstChar(this.getCommandVal()));
  },
  lowerFirstChar: function(string) {
    return string.charAt(0).toLowerCase() + string.slice(1);
  }
}
