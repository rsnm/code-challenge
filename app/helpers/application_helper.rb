module ApplicationHelper

  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      errors: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def get_city_state(company)
    [company.city || 'City', ',', company.state || 'State'].join
  end
end
