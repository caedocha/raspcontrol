class WindowInfo

  def self.get_omx_info
    windows = get_all_windows
    windows.select do |window|
      info = get_window_info(window)
      info.include? 'xterm'
    end.first
  end

  def self.get_all_windows
    results = `xprop -root | grep _NET_CLIENT_LIST_STACKING\\(WINDOW\\)`
    results.gsub('_NET_CLIENT_LIST_STACKING(WINDOW): window id #', '')
      .split(', ')
      .map{ |r| r.strip }
  end

  def self.get_window_info(window)
    `xprop -id #{window}`
  end

end
