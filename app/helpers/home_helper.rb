module HomeHelper

  def previous_searches
    cookies[:searches] ? cookies[:searches].split('|').reverse.reject(&:blank?) : []
  end

  def append_search
    if params[:q].present?
      start = Time.now
      anagrams = Rangama::FastSearch.new(params[:q],user).anagrams(true)
      finish = Time.now
      cookies[:searches] = "#{cookies[:searches]}|#{anagrams} (#{time_taken(start,finish)}ms)"
    end
  end

  def clear_searches
    cookies[:searches] = ''
  end

  def user
    cookies[:rangama_uuid]
  end

  def upload_dictionary
    Rangama::SortedDictionary.new(params[:dictionary].to_io,user,true)
  end

  def time_taken(start,finish)
    ((finish - start)*1000).round(2)
  end
end
