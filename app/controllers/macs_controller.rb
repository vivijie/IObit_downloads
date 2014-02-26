class MacsController < ApplicationController
  def show
    @mac = Mac.find(params[:id])
    @records = Record.all
  end

  def new
    @mac = Mac.new
  end
 
  def create 
    # binding.pry
    @mac = Mac.new(mac_params)
    if @mac.save
      flash[:notice] = "New Mac was created."
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def mac_params
    params.require(:mac).permit!
  end
end
