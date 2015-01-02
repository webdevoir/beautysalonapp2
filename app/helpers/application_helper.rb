module ApplicationHelper
  def toggle_visibility(object)
    if object.visible?
      "Verbergen"
    else
      "Tonen"
    end
  end

  def options_for_categories
    Category.all.map { |category| [category.name, category.id] }
  end

  def available?(collection)
    collection.count != 0
  end
end
