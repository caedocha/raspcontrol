class OMXPlayer

  OPTIONS = {
    fg: 'black',
    bg: 'black',
    output: 'hdmi'
  }

  def self.launch(video)
    command = "#{set_env_display} && xterm -e 'xterm -fullscreen -fg black -bg black -e omxplayer -o hdmi #{video}' &"
    fork do
      exec command
    end
  end

  def self.play_pause
    omx_window = WindowInfo.get_omx_info
    `#{set_env_display} && xdotool windowactivate #{omx_window} && xdotool key p`
  end

  def self.quit
    omx_window = WindowInfo.get_omx_info
    `#{set_env_display} && xdotool windowactivate #{omx_window} && xdotool key q`
  end

  def self.increase_volume
    omx_window = WindowInfo.get_omx_info
    `#{set_env_display} && xdotool windowactivate #{omx_window} && xdotool key plus`
  end

  def self.decrease_volume
    omx_window = WindowInfo.get_omx_info
    `#{set_env_display} && xdotool windowactivate #{omx_window} && xdotool key minus`
  end

  def self.seek_forward
    omx_window = WindowInfo.get_omx_info
    `#{set_env_display} && xdotool windowactivate #{omx_window} && xdotool key Right`
  end

  def self.seek_backward
    omx_window = WindowInfo.get_omx_info
    `#{set_env_display} && xdotool windowactivate #{omx_window} && xdotool key Left`
  end

  private

  def set_env_display
    'export DISPLAY=:0'
  end

  def exec_command_on_window
  end

  def is_xdotool_installed?
  end

  def is_omxplayer_installed?
  end

end
