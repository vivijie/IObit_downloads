class NodesController < ApplicationController
  before_action :require_user 

  def index
    @nodes = Node.all
    @records = Record.all
  end
end
