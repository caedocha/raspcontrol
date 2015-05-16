module EnvUtils

  def self.set_env_display
    'export DISPLAY=:0'
  end

  def self.kill_pids(pids)
    pids.each do |pid|
      begin
        Process.kill('KILL', pid.to_i)
      rescue
        Rails.logger.info("Could not kill process: #{pid}")
        Rails.logger.info("Process info: #{`ps -p #{pid} -o comm=`}")
      end
    end
  end

  def self.kill_all_omx_processes
    pids = `ps aux | grep omxplayer | awk '{print $2}'`.split("\n")
    pids.each do |pid|
      begin
        Process.kill('KILL', pid.to_i)
      rescue
        pr "Could not kill process: #{pid}"
        pr "Process info: #{`ps -p #{pid} -o comm=`}"
        Rails.logger.info("Could not kill process: #{pid}")
        Rails.logger.info("Process info: #{`ps -p #{pid} -o comm=`}")
      end
    end
  end

end
