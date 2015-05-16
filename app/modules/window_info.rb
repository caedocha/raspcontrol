class WindowInfo

  def self.get_omx_info
    windows = get_all_windows
    windows.select do |window|
      info = get_window_info(window)
      info.include? 'omxplayer'
    end.first
  end

  def self.get_all_windows
    results = `#{EnvUtils.set_env_display} && xprop -root | grep _NET_CLIENT_LIST_STACKING\\(WINDOW\\)`
    results.gsub('_NET_CLIENT_LIST_STACKING(WINDOW): window id #', '')
      .split(', ')
      .map{ |r| r.strip }
  end

  def self.get_window_info(window)
    `#{EnvUtils.set_env_display} && xprop -id #{window}`
  end

end
