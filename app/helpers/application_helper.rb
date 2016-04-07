module ApplicationHelper

  def sortable_header(column, title = nil)
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    header_class = "header"
    if (column == sort_column)
      header_class += (sort_direction == "asc") ? " header-sort-up" : " header-sort-down" 
    end
    link = link_to title, params.merge({sort: column, direction: direction})
    content_tag(:th, link, class: header_class)
  end


  def form_errors_for(object=nil)
    render('shared/form_errors', object: object) unless object.blank?
  end

end
