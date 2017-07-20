module HomeHelper

  def previous_searches
    cookies[:searches] ? cookies[:searches].split('|').reverse : []
  end

  def append_search
    cookies[:searches] = "#{cookies[:searches]}|#{params[:q]}" if params[:q].present?
  end

  def clear_searches
    cookies[:searches] = ''
  end

end
