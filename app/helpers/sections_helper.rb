module SectionsHelper
  def belongs_to_section?(behandeling, section)
    behandeling.category_id == section.category_id 
  end
end
