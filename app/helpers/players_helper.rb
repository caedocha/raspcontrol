module PlayersHelper

  def trim_path(path, file)
    file_dup = file.dup
    file_dup.slice!(path)
    file_dup.slice!(0)
    file_dup
  end

end
