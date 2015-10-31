module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"

    if (column == sort_column)
      glyph_class = (sort_direction == "asc") ? "glyphicon-triangle-top" : "glyphicon-triangle-bottom" 
      title = title + content_tag(:span, nil, class: "glyphicon #{glyph_class} pull-right")
    end

    link_to raw(title), params.merge({sort: column, direction: direction})
  end
end
