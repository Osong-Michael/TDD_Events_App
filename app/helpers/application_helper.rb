module ApplicationHelper
  def page_title
    if content_for?(:title)
      "Events - #{content_for(:title)}"
    else
      'Events'
    end
  end
  
end
