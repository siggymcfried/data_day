module ApplicationHelper
  def icon_for(icon_name)
    Icon.new(icon_name: icon_name).render
  end

  def badge_for(value:)
    content_tag(:span, value, class: 'badge')
  end
end
