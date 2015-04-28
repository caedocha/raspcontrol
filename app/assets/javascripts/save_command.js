var saveCommand = {
  init: function() {
    var that = this;
    this.hideCommandName();
    this.getSaveButton().hide();
    this.getMessage().hide();
    this.getCreateButton().click(function() {
      that.showCommandName();
      that.getCreateButton().hide();
      that.getSaveButton().show();
    });
    this.getSaveButton().click(function() {
      that.save();
    });
  },
  getSaveButton: function() {
    return $('#save_command');
  },
  getCreateButton: function() {
    return $('#create_command');
  },
  getCommandName: function() {
    return $('#name');
  },
  getMessage: function() {
    return $('#message');
  },
  showCommandName: function() {
    this.getCommandName().show();
    this.getCommandName().removeClass('hidden');
  },
  hideCommandName: function() {
    this.getCommandName().hide();
    this.getCommandName().addClass('hidden');
  },
  toggleCommandName: function() {
    if(this.getCommandName().hasClass('hidden')) {
      this.showCommandName();
    } else {
      this.hideCommandName();
    }
  },
  save: function() {
    var that = this;
    $.ajax({
      method: 'POST',
      url: '/raspberries',
      data: {
        name: that.getCommandName().val(),
        command: execCommand.getCommand().val()
      },
      type: 'json'
    }).done( function(data) {
      that.getMessage().html(data)
      that.getMessage().show().delay(500).fadeOut(1000);
      that.getSaveButton().hide();
      that.getCreateButton().show();
      that.getCommandName().val('');
      that.hideCommandName();
      execCommand.setCommand('');
    });
  }
}
