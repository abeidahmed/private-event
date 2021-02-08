module ToastHelper
  def toast_icon_for(status)
    case status
    when 'error'
      'stop'
    when 'success'
      'check'
    else
      raise "Undefined flash type: #{status}"
    end
  end
end
