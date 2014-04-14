class Mac < ActiveRecord::Base
  has_many :records
  belongs_to :node

  validates :name, :mac_address, presence: true
  validates_uniqueness_of :mac_address
  def hour_downloads(time)
    self.records.where(created_at: self.time_range(time)).sum("downloads")
  end

  def mac_today_downloads(days_ago)
    self.records.where('created_at >= ? and created_at <= ?', (Time.now - days_ago.day + 8.hour).beginning_of_day - 8.hour, (Time.now - days_ago.day + 8.hour).end_of_day - 8.hour).sum("downloads")
  end

  def time_range(time)
    ((Time.now + 8.hour).midnight + (time-9).hour)..((Time.now + 8.hour).midnight + (time-8).hour)
  end

  def time_range_to_admin(time)
    (Time.now.midnight + (time-1).hour).strftime("%H:%M")..(Time.now.midnight + time.hour).strftime("%H:%M")
  end
end
