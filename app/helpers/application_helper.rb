module ApplicationHelper
  # allow login from any controller in the application
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end
end
