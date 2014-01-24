class MacsController < ApplicationController
  def show
    @mac = Mac.find(params[:id])
    @records = Record.all
  end
end
