module ApplicationHelper
  def format_file_size(bytes)
    return "0 Bytes" if bytes.nil? || bytes == 0
    units = [ "Bytes", "KB", "MB", "GB", "TB" ]
    i = (Math.log(bytes) / Math.log(1024)).floor
    format("%.2f %s", bytes.to_f / (1024 ** i), units[i])
  end

  def icon(name, classes = "w-6 h-6")
    path = case name
    when :folder
      '<path d="M4 20h16a2 2 0 0 0 2-2V8a2 2 0 0 0-2-2h-7.93a2 2 0 0 1-1.66-.9l-.82-1.2A2 2 0 0 0 7.93 3H4a2 2 0 0 0-2 2v13c0 1.1.9 2 2 2Z"/><path d="M2 10h20"/>'
    when :upload_cloud
      '<path d="M4 14.899A7 7 0 1 1 15.71 8h1.79a4.5 4.5 0 0 1 2.5 8.242"/><path d="M12 12v9"/><path d="m16 16-4-4-4 4"/>'
    when :search
      '<circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/>'
    when :log_out
      '<path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" x2="9" y1="12" y2="12"/>'
    when :trash
      '<path d="M3 6h18"/><path d="M19 6v14c0 1.1-.9 2-2 2H7c-1.1 0-2-.9-2-2V6"/><path d="M8 6V4c0-1.1.9-2 2-2h4c1.1 0 2 .9 2 2v2"/><line x1="10" x2="10" y1="11" y2="17"/><line x1="14" x2="14" y1="11" y2="17"/>'
    when :file_text
      '<path d="M14.5 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7.5L14.5 2z"/><polyline points="14 2 14 8 20 8"/><line x1="16" x2="8" y1="13" y2="13"/><line x1="16" x2="8" y1="17" y2="17"/><line x1="10" x2="8" y1="9" y2="9"/>'
    when :image
      '<rect width="18" height="18" x="3" y="3" rx="2" ry="2"/><circle cx="9" cy="9" r="2"/><path d="m21 15-3.086-3.086a2 2 0 0 0-2.828 0L6 21"/>'
    when :lock
      '<rect width="18" height="11" x="3" y="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/>'
    when :alert_circle
      '<circle cx="12" cy="12" r="10"/><line x1="12" x2="12" y1="8" y2="12"/><line x1="12" x2="12.01" y1="16" y2="16"/>'
    else # Default File
      '<path d="M14.5 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7.5L14.5 2z"/><polyline points="14 2 14 8 20 8"/>'
    end

    content_tag(:svg, path.html_safe, xmlns: "http://www.w3.org/2000/svg", width: "24", height: "24", viewBox: "0 0 24 24", fill: "none", stroke: "currentColor", stroke_width: "2", stroke_linecap: "round", stroke_linejoin: "round", class: classes)
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
