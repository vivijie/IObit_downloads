class Record < ActiveRecord::Base
  belongs_to :mac

  def self.today_downloads
    Record.where("created_at >= :tody_date", tody_date: Date.today).sum("downloads")
  end
end
