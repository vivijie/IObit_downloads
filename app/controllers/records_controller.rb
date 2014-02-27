class RecordsController < ApplicationController
  before_action :require_user, except: [:create]
  skip_before_filter :verify_authenticity_token, 
  :if => Proc.new { |c| c.request.format == 'application/json' }

  def create
    @mac = Mac.find_by mac_address: params["mac_address"]
    if !@mac.nil?
      new_record = Record.new
      new_record.mac_id = @mac.id 
      new_record.downloads = params["downloads"]
      new_record.save
      redirect_to upload_success_path 
    else 
      flash[:error] = "Wrong Mac Address!"
      redirect_to wrong_mac_address_path 
    end
  end

  def week
    @records = Record.all
  end

  def index
    @records = Record.today_records
  end

  def wrong; end

  def upload_success; end
end
