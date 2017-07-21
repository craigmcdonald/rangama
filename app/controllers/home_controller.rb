class HomeController < ApplicationController

  def index
    helpers.append_search
    @word = cookies[:searches]
  end

  def search
    redirect_to root_path q: params[:q]
  end

  def upload
    start = Time.now
    msg = if params[:dictionary].present? && helpers.upload_dictionary
      'dictionary uploaded successfully'
    else
      'please select a valid file'
    end
    finish = Time.now
    redirect_to root_path, notice: "#{msg} (#{helpers.time_taken(start,finish)}ms)"
  end

  def clear
    helpers.clear_searches
    redirect_to root_path
  end
end
