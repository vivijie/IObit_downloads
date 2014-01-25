class Record < ActiveRecord::Base
  belongs_to :mac

  def self.today_downloads
    self.where('created_at >= ? and created_at <= ?', (Time.now - 8.hour).beginning_of_day, (Time.now - 8.hour).end_of_day).sum("downloads")
  end

  # Count every day downloads at one week.
  def self.day_downloads(time)
    self.where(created_at: self.time_range(time)).sum("downloads")
  end

  def self.time_range(time)
    (Time.now.beginning_of_week - 8.hour + (time-1).day)..(Time.now.beginning_of_week - 8.hour + time.day)
  end

  def self.week_time_range_to_admin(time)
    ((Time.now + 8.hour).beginning_of_week + (time-1).day).strftime("%b-%d-%A")
  end

  def self.week_downloads
  	self.where('created_at >= ? and created_at <= ?', (Time.now - 8.hour).beginning_of_week, (Time.now - 8.hour).end_of_week).sum("downloads")
  end

end
