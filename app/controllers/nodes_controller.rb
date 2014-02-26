class NodesController < ApplicationController
  before_action :require_user 

  def index
    @nodes = Node.all
    @records = Record.all.sort_by{|x| x.downloads}
    @today_downloads = Record.today_downloads
  end
end
