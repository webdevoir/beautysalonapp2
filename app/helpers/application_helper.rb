module ApplicationHelper
  def toggle_visibility(object)
    if object.visible?
      "Verbergen"
    else
      "Tonen"
    end
  end
end
