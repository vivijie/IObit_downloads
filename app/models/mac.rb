class Mac < ActiveRecord::Base
  has_many :records
  belongs_to :node

  def hour_downloads(time)
    self.records.where(created_at: self.time_range(time)).sum("downloads")
  end

  def mac_today_downloads
    self.records.sum(:downloads)
  end

  def time_range(time)
    (Time.now.midnight + (time-1).hour)..(Time.now.midnight + time.hour)
  end

  def time_range_to_admin(time)
    (Time.now.midnight + (time-1).hour).strftime("%H:%M")..(Time.now.midnight + time.hour).strftime("%H:%M")
  end
end
