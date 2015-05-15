require 'yaml'

pr Rails.root.join('config', 'video_library.yml')
VIDEO_LIBRARIES = YAML::load(File.open(Rails.root.join('config', 'video_library.yml')))['videos']
