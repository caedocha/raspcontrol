class PlayersController < ApplicationController

  def index
    session[:omx_pids] ||= []
    pr session[:omx_pids]
    @video_libraries = VideoLibraryLoader.list_videos
  end

  def launch
    session[:omx_pids] << OMXPlayer.launch(params[:video])
    pr session[:omx_pids]
    render nothing: true
  end

  def exec_command
    OMXPlayer.send(params[:command].to_sym)
    if params[:command] == 'quit'
      pr session[:omx_pids]
      EnvUtils.kill_pids(session[:omx_pids])
    end
    render nothing: true
  end

end
