class Mac < ActiveRecord::Base
  has_many :records
  belongs_to :node

  def hour_downloads(time)
    self.records.where(created_at: self.time_range(time)).sum("downloads")
  end

  def mac_today_downloads
    self.records.where('created_at >= ? and created_at <= ?', (Time.now - 8.hour).beginning_of_day, (Time.now - 8.hour).end_of_day).sum("downloads")
  end

  def time_range(time)
    (Time.now.midnight + (time-9).hour)..(Time.now.midnight + (time-8).hour)
  end

  def time_range_to_admin(time)
    (Time.now.midnight + (time-1).hour).strftime("%H:%M")..(Time.now.midnight + time.hour).strftime("%H:%M")
  end
end
