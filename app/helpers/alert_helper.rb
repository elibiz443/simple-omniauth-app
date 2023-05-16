module AlertHelper
  def build_alert_classes(alert_type)
    case alert_type.to_sym
    when :alert, :danger, :error, :validation_errors
      "bg-[#F8D7DB] rounded-md text-[#721C24] p-4"
    when :warning, :todo
      "bg-[#FFF3CD] rounded-md text-[#856405] p-4"
    when :notice, :success
      "bg-[#D4EDDA] rounded-md text-[#165724] p-4"
    else
      "bg-[#D1ECF1] rounded-md text-[#0D5460] p-4"
    end
  end
end
