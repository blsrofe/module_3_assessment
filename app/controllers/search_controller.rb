class SearchController < ApplicationController
  def index
    @stores = Store.find_by_zip(params[:zip]).paginate(:page => params[:page], :per_page => 10)
  end
end
