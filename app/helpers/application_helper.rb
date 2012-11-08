module ApplicationHelper
  
  # Devuelve el titulo completo
  def full_title (page_title)
    base_title = "Portfolio of Projects"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end