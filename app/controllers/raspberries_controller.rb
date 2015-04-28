require 'open3'
class RaspberriesController < ApplicationController

  def index
    session["pids"] ||= [] if session["pids"].nil?
  end

  def list_all
    @raspberries = Raspberry.all
  end

  def create
    if request.xhr?
      raspberry = Raspberry.new({name: params[:name], command: params[:command]})
      message = ''
      if raspberry.save
        message = 'Raspberry command saved!'
      else
        message = 'Failed to save raspberry command'
      end
      respond_to do |format|
        format.json {render json: message.to_json}
      end
    end
  end

  def exec_command
    if request.xhr?
      result = run_command(params[:command])
      respond_to do |format|
        format.json { render json: result.to_json }
      end
    end
  end

  private

  def run_command(command)
    result = if command.include?('&')
      pid = fork { exec command }
      session["pids"] << pid
      "Command running async, PID: #{pid}"
    else
      `#{command}`
    end
    result
  end

end
