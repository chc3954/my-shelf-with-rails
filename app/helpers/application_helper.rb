module ApplicationHelper
  def format_file_size(bytes)
    return "0 Bytes" if bytes.nil? || bytes == 0
    units = [ "Bytes", "KB", "MB", "GB", "TB" ]
    i = (Math.log(bytes) / Math.log(1024)).floor
    format("%.2f %s", bytes.to_f / (1024 ** i), units[i])
  end

  def get_file_icon(type)
    type ||= ""
    if type.include?("image")
      icon(:image, "w-8 h-8 text-purple-400")
    elsif type.include?("video")
      icon(:file_text, "w-8 h-8 text-pink-400")
    elsif type.include?("text") || type.include?("pdf")
      icon(:file_text, "w-8 h-8 text-blue-400")
    else
      icon(:file, "w-8 h-8 text-slate-400")
    end
  end
end
