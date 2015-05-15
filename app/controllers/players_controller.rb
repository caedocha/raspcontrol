class PlayersController < ApplicationController

  def index
    @video_libraries = VideoLibraryLoader.list_videos
  end

  def launch
    OMXPlayer.launch(params[:video])
    render nothing: true
  end

  def exec_command
    OMXPlayer.send(params[:video].to_sym)
    render nothing: true
  end

end
