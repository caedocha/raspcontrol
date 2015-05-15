
class VideoLibraryLoader

  VIDEO_FORMATS = [ :mkv, :mov, :mp4 ]

  def self.list_videos
    libraries = {}
    VIDEO_LIBRARIES.each do |library|
      all_files = "#{library}/**/*"
      libraries[library] = filter_files(Dir.glob(all_files))
    end
    libraries
  end

  def self.filter_files(files)
    files.select do |file|
      VIDEO_FORMATS.include?(extract_file_ext(file))
    end
  end

  def self.extract_file_ext(file)
    File.extname(file)
      .gsub('.', '')
      .to_sym
  end

end
