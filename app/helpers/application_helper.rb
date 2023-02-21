module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Social media sample App'

    if base_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
