class OMXPlayer

  OPTIONS = {
    fg: 'black',
    bg: 'black',
    output: 'hdmi'
  }

  def self.launch(video)
    command = "xterm -e 'xterm -fullscreen -fg black -bg black -e omxplayer -o hdmi #{video}' &"
    fork do
      exec command
    end
  end

  def self.play_pause
    omx_window = WindowInfo.get_omx_info
    `xdotool windowactivate #{omx_window} && xdotool key p`
  end

  def self.quit
    `xdotool key q`
  end

  def self.increase_volume
    `xdotool key plus`
  end

  def self.decrease_volume
    `xdotool key minus`
  end

  def self.seek_forward
    `xdotool key Right`
  end

  def self.seek_backward
    `xdotool key Left`
  end

  private

  def is_xdotool_installed?
  end

  def is_omxplayer_installed?
  end

end
