class HomeController < ApplicationController

  def index
    helpers.append_search
    @word = cookies[:searches]
  end

  def search
    redirect_to root_path q: params[:q]
  end

  def upload
    msg = params[:dictionary].present? ?
      'dictionary uploaded successfully' :
      'please select a valid file'
    redirect_to root_path, notice: msg
  end

  def clear
    helpers.clear_searches
    redirect_to root_path
  end

end
